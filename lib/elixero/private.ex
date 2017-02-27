defmodule EliXero.Private do

	#urls
	@accounting_base_url "https://api.xero.com/api.xro/2.0/"

	#cert details
	@private_key Application.get_env(:elixero, :private_key_path)

	#consumer details
	@oauth_consumer_key Application.get_env(:elixero, :consumer_key)

	@user_agent "EliXero - " <> @oauth_consumer_key	

	def get(resource) do
		url = @accounting_base_url <> resource
		header = get_auth_header("GET", url, [oauth_token: @oauth_consumer_key])
		EliXero.Utils.Http.get(url, header)
	end	

	defp get_auth_header(method, url, additional_params) do
		timestamp = Float.to_string(Float.floor(:os.system_time(:milli_seconds) / 1000), decimals: 0)

		params = additional_params ++
			[
				oauth_consumer_key: @oauth_consumer_key,
				oauth_nonce: EliXero.Utils.Helpers.random_string(10),
				oauth_signature_method: "RSA-SHA1",
				oauth_version: "1.0",
				oauth_timestamp: timestamp
			]

		uri_parts = String.split(url, "?")
		url = Enum.at(uri_parts, 0)

		params_with_query_params =
			if (length(uri_parts) > 1) do
				query_params = Enum.at(uri_parts, 1) |> URI.decode_query |> Enum.map(fn({key, value}) -> {String.to_atom(key), URI.encode_www_form(value)} end)
				params ++ query_params
			else
				params
			end
		
		params_with_query_params = Enum.sort(params_with_query_params)
		
		base_string = 
			method <> "&" <> 
			URI.encode_www_form(url) <> "&" <>
			URI.encode_www_form(
				EliXero.Utils.Helpers.join_params_keyword(params_with_query_params, :base_string)
			)

		signature = rsa_sha1_sign(base_string)

		#Don't add the params_with_query_params as the query params are already in the actual url. Just add params
		"OAuth oauth_signature=\"" <> signature <> "\", " <> EliXero.Utils.Helpers.join_params_keyword(params, :auth_header)
	end

	defp rsa_sha1_sign(basestring) do
		hashed = :crypto.hash(:sha, basestring)

		{:ok, body} = File.read @private_key

		[decoded_key] = :public_key.pem_decode(body)
		key = :public_key.pem_entry_decode(decoded_key)
		signed = :public_key.encrypt_private(hashed, key)
		URI.encode(Base.encode64(signed), &URI.char_unreserved?(&1))
	end

	
end