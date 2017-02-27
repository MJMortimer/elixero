defmodule EliXero.Public do

	#urls
	@base_url "https://api.xero.com/"
	@request_token_url @base_url <> "oauth/RequestToken"
	@access_token_url @base_url <> "oauth/AccessToken"
	@authorise_url @base_url <> "oauth/Authorize"
	@accounting_base_url @base_url <> "api.xro/2.0/"

	#consumer details
	@oauth_consumer_key Application.get_env(:elixero, :consumer_key)
	@oauth_consumer_secret Application.get_env(:elixero, :consumer_secret)

	def get_request_token do
		callback_url = Application.get_env(:elixero, :callback_url)
		header = get_auth_header("GET", @request_token_url, [oauth_callback: callback_url])
		EliXero.Utils.Http.get(@request_token_url, header)
	end

	def generate_auth_url(request_token) do
		@authorise_url <> "?oauth_token=" <> request_token["oauth_token"]
	end

	def approve_access_token(request_token, verifier) do
		header = get_auth_header("GET", @access_token_url, request_token, [oauth_token: request_token["oauth_token"], oauth_verifier: verifier])
		EliXero.Utils.Http.get(@access_token_url, header)
	end

	def get(access_token, resource) do
		url = @accounting_base_url <> resource
		header = get_auth_header("GET", url, access_token, [oauth_token: access_token["oauth_token"]])
		EliXero.Utils.Http.get(@access_token_url, header)
	end	

	defp get_auth_header(method, url, additional_params) do
		get_auth_header(method, url, nil, additional_params)
	end

	defp get_auth_header(method, url, token, additional_params) do
		timestamp = Float.to_string(Float.floor(:os.system_time(:milli_seconds) / 1000), decimals: 0)

		params = (additional_params ++
			[
				oauth_consumer_key: @oauth_consumer_key,
				oauth_nonce: EliXero.Utils.Helpers.random_string(10),
				oauth_signature_method: "HMAC-SHA1",
				oauth_version: "1.0",
				oauth_timestamp: timestamp
			]) |> Enum.sort

		base_string = 
			method <> "&" <> 
			URI.encode_www_form(url) <> "&" <>
			URI.encode_www_form(
				EliXero.Utils.Helpers.join_params_keyword(params, :base_string)
			)

		signature = hmac_sha1_sign(base_string, token)

		"OAuth oauth_signature=\"" <> signature <> "\", " <> EliXero.Utils.Helpers.join_params_keyword(params, :auth_header)
	end

	defp hmac_sha1_sign(basestring, token) do
		key = 
			case(token) do
				nil -> @oauth_consumer_secret <> "&"
				_ -> @oauth_consumer_secret <> "&" <> token["oauth_token_secret"]
			end
		signed = :crypto.hmac(:sha, key, basestring)
		URI.encode(Base.encode64(signed), &URI.char_unreserved?(&1))
	end
end