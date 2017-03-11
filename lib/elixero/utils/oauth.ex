defmodule EliXero.Utils.Oauth do
  @oauth_consumer_key Application.get_env(:elixero, :consumer_key)
  @oauth_consumer_secret Application.get_env(:elixero, :consumer_secret)
  @application_type Application.get_env(:elixero, :app_type)
  @private_key Application.get_env(:elixero, :private_key_path)

  def create_auth_header(method, url, additional_params, form_data, token) do
    {base_string, oauth_params} = create_oauth_context(method, url, additional_params, form_data)

    signature = sign(base_string, token)

    "OAuth oauth_signature=\"" <> signature <> "\", " <> EliXero.Utils.Helpers.join_params_keyword(oauth_params, :auth_header)
  end

  def create_auth_header(method, url, additional_params, form_data) do
    {base_string, oauth_params} = create_oauth_context(method, url, additional_params, form_data)

    signature = sign(base_string)

    "OAuth oauth_signature=\"" <> signature <> "\", " <> EliXero.Utils.Helpers.join_params_keyword(oauth_params, :auth_header)
  end

  defp create_oauth_context(method, url, additional_params, form_data) do
    timestamp = Float.to_string(Float.floor(:os.system_time(:milli_seconds) / 1000), decimals: 0)

    oauth_signing_params = [
        oauth_consumer_key: @oauth_consumer_key,
        oauth_nonce: EliXero.Utils.Helpers.random_string(10),
        oauth_signature_method: signature_method(),
        oauth_version: "1.0",
        oauth_timestamp: timestamp
      ]

    params = additional_params ++ oauth_signing_params

    uri_parts = String.split(url, "?")
    url = Enum.at(uri_parts, 0)

    params_with_extras =
      if (length(uri_parts) > 1) do
        query_params = Enum.at(uri_parts, 1) |> URI.decode_query |> Enum.map(fn({key, value}) -> {String.to_atom(key), URI.encode_www_form(value)} end)
        params ++ query_params
      else
        params
      end

    params_with_extras =
      case(form_data) do
        nil -> params_with_extras
        _ -> params_with_extras ++ form_data
      end

    params_with_extras = Enum.sort(params_with_extras)

    base_string =
      method <> "&" <>
      URI.encode_www_form(url) <> "&" <>
      URI.encode_www_form(
        EliXero.Utils.Helpers.join_params_keyword(params_with_extras, :base_string)
      )

    {base_string, params}
  end

  def sign(base_string) do
    rsa_sha1_sign(base_string)
  end

  def sign(base_string, token) do
    hmac_sha1_sign(base_string, token)
  end

  defp signature_method() do
    case(@application_type) do
      :private -> "RSA-SHA1"
      :public -> "HMAC-SHA1"
      :partner -> "RSA-SHA1"
    end
  end

  defp rsa_sha1_sign(base_string) do
    hashed = :crypto.hash(:sha, base_string)

    {:ok, body} = File.read @private_key

    [decoded_key] = :public_key.pem_decode(body)
    key = :public_key.pem_entry_decode(decoded_key)
    signed = :public_key.encrypt_private(hashed, key)
    URI.encode(Base.encode64(signed), &URI.char_unreserved?(&1))
  end

  defp hmac_sha1_sign(base_string, token) do
    key =
      case(token) do
        nil -> @oauth_consumer_secret <> "&"
        _ -> @oauth_consumer_secret <> "&" <> token["oauth_token_secret"]
      end
    signed = :crypto.hmac(:sha, key, base_string)
    URI.encode(Base.encode64(signed), &URI.char_unreserved?(&1))
  end

end