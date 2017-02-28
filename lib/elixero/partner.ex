defmodule EliXero.Partner do

	#urls
	@base_url "https://api.xero.com/"
	@request_token_url @base_url <> "oauth/RequestToken"
	@access_token_url @base_url <> "oauth/AccessToken"
	@authorise_url @base_url <> "oauth/Authorize"
	@accounting_base_url @base_url <> "api.xro/2.0/"

	#cert details
	@private_key Application.get_env(:elixero, :private_key_path)

	#consumer details
	@oauth_consumer_key Application.get_env(:elixero, :consumer_key)
	@oauth_consumer_secret Application.get_env(:elixero, :consumer_secret)

	def get_request_token do
		callback_url = Application.get_env(:elixero, :callback_url)
		header = EliXero.Utils.Oauth.create_auth_header("GET", @request_token_url, [oauth_callback: callback_url])
		EliXero.Utils.Http.get(@request_token_url, header)
	end

	def generate_auth_url(request_token) do
		@authorise_url <> "?oauth_token=" <> request_token["oauth_token"]
	end

	def approve_access_token(request_token, verifier) do
		header = EliXero.Utils.Oauth.create_auth_header("GET", @access_token_url, [oauth_token: request_token["oauth_token"], oauth_verifier: verifier])
		EliXero.Utils.Http.get(@access_token_url, header)
	end

	def renew_access_token(access_token) do
		header = EliXero.Utils.Oauth.create_auth_header("GET", @access_token_url, [ oauth_token: access_token["oauth_token"], oauth_session_handle: access_token["oauth_session_handle"] ])
		EliXero.Utils.Http.get(@access_token_url, header)
	end

	def get(access_token, resource) do
		url = @accounting_base_url <> resource
		header = EliXero.Utils.Oauth.create_auth_header("GET", url, [oauth_token: access_token["oauth_token"]])
		EliXero.Utils.Http.get(url, header)	
	end		
end