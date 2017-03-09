defmodule EliXero.Partner do
	#cert details
	@private_key Application.get_env(:elixero, :private_key_path)

	#consumer details
	@oauth_consumer_key Application.get_env(:elixero, :consumer_key)
	@oauth_consumer_secret Application.get_env(:elixero, :consumer_secret)

	def get_request_token do
		callback_url = Application.get_env(:elixero, :callback_url)
		request_token_url = EliXero.Utils.Urls.request_token
		header = EliXero.Utils.Oauth.create_auth_header("GET", request_token_url, [oauth_callback: callback_url])
		EliXero.Utils.Http.get(request_token_url, header)
	end

	def generate_auth_url(request_token) do
		EliXero.Utils.Urls.authorise(request_token["oauth_token"])
	end

	def approve_access_token(request_token, verifier) do
		access_token_url = EliXero.Utils.Urls.access_token
		header = EliXero.Utils.Oauth.create_auth_header("GET", access_token_url, [oauth_token: request_token["oauth_token"], oauth_verifier: verifier])
		EliXero.Utils.Http.get(access_token_url, header)
	end

	def renew_access_token(access_token) do
		access_token_url = EliXero.Utils.Urls.access_token
		header = EliXero.Utils.Oauth.create_auth_header("GET", access_token_url, [ oauth_token: access_token["oauth_token"], oauth_session_handle: access_token["oauth_session_handle"] ])
		EliXero.Utils.Http.get(access_token_url, header)
	end

	def get(access_token, resource, api_type) do		
		url = EliXero.Utils.Urls.api(resource, api_type)
		header = EliXero.Utils.Oauth.create_auth_header("GET", url, [oauth_token: access_token["oauth_token"]])
		EliXero.Utils.Http.get(url, header)
	end

	def create(access_token, resource, api_type, data_map) do
		url = EliXero.Utils.Urls.api(resource, api_type)

		method =
			case(api_type) do
				:core -> "PUT"
			end

		header = EliXero.Utils.Oauth.create_auth_header(method, url, [oauth_token: access_token["oauth_token"]])
		
		response = 
			case(method) do
				"PUT" -> EliXero.Utils.Http.put(url, header, data_map)
			end

		response
	end		
end