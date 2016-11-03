defmodule EliXero.Partner do

	#urls
	@base_url "https://api-partner.network.xero.com/"
	@request_token_url @base_url <> "oauth/RequestToken"
	@access_token_url @base_url <> "oauth/AccessToken"
	@authorise_url "https://api.xero.com/oauth/Authorize"
	@accounting_base_url @base_url <> "api.xro/2.0/"

	#cert details
	@entrust_cert Application.get_env(:elixero, :entrust_cert_path)
	@entrust_key Application.get_env(:elixero, :entrust_key_path)
	@entrust_password Application.get_env(:elixero, :entrust_password)
	@private_key Application.get_env(:elixero, :private_key_path)

	#consumer details
	@oauth_consumer_key Application.get_env(:elixero, :consumer_key)
	@oauth_consumer_secret Application.get_env(:elixero, :consumer_secret)

	@callback_url Application.get_env(:elixero, :callback_url)

	@user_agent "EliXero - " <> @oauth_consumer_key	

	def get_request_token do
		header = get_auth_header("GET", @request_token_url, [oauth_callback: @callback_url])

		{:ok, response} = HTTPoison.get @request_token_url, [{"Authorization", header}, {"Accept", "application/json"}, {"User-Agent", @user_agent}], [
			hackney: [ 
				ssl_options: [ 
					certfile: @entrust_cert,
					keyfile: @entrust_key,
					password: @entrust_password
				]
			]
		]

		URI.decode_query(response.body)
	end

	def generate_auth_url(request_token) do
		@authorise_url <> "?oauth_token=" <> request_token["oauth_token"]
	end

	def approve_access_token(request_token, verifier) do
		header = get_auth_header("GET", @access_token_url, [oauth_token: request_token["oauth_token"], oauth_verifier: verifier])

		{:ok, response} = HTTPoison.get @access_token_url, [{"Authorization", header}, {"Accept", "application/json"}, {"User-Agent", @user_agent}], [
			hackney: [ 
				ssl_options: [ 
					certfile: @entrust_cert,
					keyfile: @entrust_key,
					password: @entrust_password
				]
			]
		]

		URI.decode_query(response.body)

	end

	def renew_access_token(access_token) do
		header = get_auth_header("GET", @access_token_url, [ oauth_token: access_token["oauth_token"], oauth_session_handle: access_token["oauth_session_handle"] ])

		{:ok, response} = HTTPoison.get @access_token_url, [{"Authorization", header}, {"Accept", "application/json"}, {"User-Agent", @user_agent}], [
			hackney: [ 
				ssl_options: [ 
					certfile: @entrust_cert,
					keyfile: @entrust_key,
					password: @entrust_password
				]
			]
		]

		URI.decode_query(response.body)
	end

	def get(access_token, resource) do
		url = @accounting_base_url <> resource
		header = get_auth_header("GET", url, [oauth_token: access_token["oauth_token"]])

		{:ok, _} = HTTPoison.get url, [{"Authorization", header}, {"Accept", "application/json"}, {"User-Agent", @user_agent}], [
			hackney: [ 
				ssl_options: [ 
					certfile: @entrust_cert,
					keyfile: @entrust_key,
					password: @entrust_password
				]
			]
		]
	end	

	defp get_auth_header(method, url, additional_params) do
		timestamp = Float.to_string(Float.floor(:os.system_time(:milli_seconds) / 1000), decimals: 0)

		params = (additional_params ++
			[
				oauth_consumer_key: @oauth_consumer_key,
				oauth_nonce: random_string(10),
				oauth_signature_method: "RSA-SHA1",
				oauth_version: "1.0",
				oauth_timestamp: timestamp
			]) |> Enum.sort

		base_string = 
			method <> "&" <> 
			URI.encode_www_form(url) <> "&" <>
			URI.encode_www_form(
				join_params_keyword(params, :base_string)
			)

		signature = rsa_sha1_sign(base_string)

		"OAuth oauth_signature=\"" <> signature <> "\", " <> join_params_keyword(params, :auth_header)
	end

	defp rsa_sha1_sign(basestring) do
		hashed = :crypto.hash(:sha, basestring)

		{:ok, body} = File.read @private_key

		[decoded_key] = :public_key.pem_decode(body)
		key = :public_key.pem_entry_decode(decoded_key)
		signed = :public_key.encrypt_private(hashed, key)
		URI.encode(Base.encode64(signed), &URI.char_unreserved?(&1))
	end

	defp random_string(length) do
  		:crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
	end

	defp join_params_keyword(keyword, :base_string) do
		Enum.map_join(keyword, "&", fn({key, value}) -> Atom.to_string(key) <> "=" <> value end)
	end

	defp join_params_keyword(keyword, :auth_header) do
		Enum.map_join(keyword, ", ", fn({key, value}) -> Atom.to_string(key) <> "=\"" <> value <> "\"" end)
	end
end