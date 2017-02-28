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
		header = EliXero.Utils.Oauth.create_auth_header("GET", url, [oauth_token: @oauth_consumer_key])
		EliXero.Utils.Http.get(url, header)
	end		
end