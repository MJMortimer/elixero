defmodule EliXero do

	#urls
	@requestTokenUrl "https://api-partner.network.xero.com/oauth/RequestToken"
	@accessTokenUrl "https://api-partner.network.xero.com/oauth/AccessToken"
	@authoriseBaseUrl "https://api.xero.com/oauth/Authorize"

	@organisationUrl "https://api-partner.network.xero.com/api.xro/2.0/Organisation"
	
	#consumer details
	@oauthConsumerKey Application.get_env(:xero, :consumer_key)
	@oauthConsumerSecret Application.get_env(:xero, :consumer_secret)
	
	#cert details
	@entrustCert Application.get_env(:xero, :entrust_cert_path)
	@entrustKey Application.get_env(:xero, :entrust_key_path)
	@entrustPassword Application.get_env(:xero, :entrust_password)
	@privateKey Application.get_env(:xero, :private_key_path)

	@callback_url Application.get_env(:xero, :callback_url)

	def getRequestToken do

		header = get_auth_header("GET", @requestTokenUrl, [oauth_callback: @callback_url])

		{:ok, response} = HTTPoison.get @requestTokenUrl, [{"Authorization", header}], [
			#{:proxy, "127.0.0.1:8888"},
			hackney: [ 
				ssl_options: [ 
					certfile: @entrustCert,
					keyfile: @entrustKey,
					password: @entrustPassword
				]
			]
		]

		URI.decode_query(response.body)
	end

	def generateAuthUrl(tokenKey) do
		IO.puts @authoriseBaseUrl <> "?oauth_token=" <> tokenKey
	end

	def approveAccessToken(tokenKey, verifier) do
		header = get_auth_header("GET", @accessTokenUrl, [oauth_token: tokenKey, oauth_verifier: verifier])

		{:ok, response} = HTTPoison.get @accessTokenUrl, [{"Authorization", header}], [
			#{:proxy, "127.0.0.1:8888"},
			hackney: [ 
				ssl_options: [ 
					certfile: @entrustCert,
					keyfile: @entrustKey,
					password: @entrustPassword
				]
			]
		]

		URI.decode_query(response.body)

	end

	def renewAccessToken(tokenKey, sessionHandle) do
		header = get_auth_header("GET", @accessTokenUrl, [oauth_token: tokenKey, oauth_session_handle: sessionHandle])

		{:ok, response} = HTTPoison.get @accessTokenUrl, [{"Authorization", header}, {"User-Agent", "Matt-Elixir"}], [
			#{:proxy, "127.0.0.1:8888"},
			hackney: [ 
				ssl_options: [ 
					certfile: @entrustCert,
					keyfile: @entrustKey,
					password: @entrustPassword
				]
			]
		]

		URI.decode_query(response.body)
	end

	def getOrganisation(tokenKey) do
		header = get_auth_header("GET", @organisationUrl, [oauth_token: tokenKey])

		{:ok, response} = HTTPoison.get @organisationUrl, [{"Authorization", header}], [
			#{:proxy, "127.0.0.1:8888"},
			hackney: [ 
				ssl_options: [ 
					certfile: @entrustCert,
					keyfile: @entrustKey,
					password: @entrustPassword
				]
			]
		]
	end

	def get_auth_header(method, url) do
		get_auth_header(method, url, [])
	end

	def get_auth_header(method, url, additional_params) do
		timestamp = Float.to_string(Float.floor(:os.system_time(:milli_seconds) / 1000), decimals: 0)

		params = (additional_params ++
			[
				oauth_consumer_key: @oauthConsumerKey,
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

		signature = rsaSha1Sign(base_string)

		"OAuth oauth_signature=\"" <> signature <> "\", " <> join_params_keyword(params, :auth_header)
	end

	defp rsaSha1Sign(baseString) do

		hashed = :crypto.hash(:sha, baseString)

		{:ok, body} = File.read @privateKey

		[decodedKey] = :public_key.pem_decode(body)
		actualFuckingKey = :public_key.pem_entry_decode(decodedKey)
		signed = :public_key.encrypt_private(hashed, actualFuckingKey)
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