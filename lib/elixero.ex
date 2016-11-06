defmodule EliXero do
	def get_request_token do
		case(Application.get_env(:elixero, :app_type)) do
			:private -> raise "Getting a request token is not applicable with Private applications."
			:public -> EliXero.Public.get_request_token
			:partner -> EliXero.Partner.get_request_token
		end
	end

	def generate_auth_url(request_token) do
		case(Application.get_env(:elixero, :app_type)) do
			:private -> raise "Generating an auth url is not applicable for Private applications"
			:public -> EliXero.Public.generate_auth_url(request_token)
			:partner -> EliXero.Partner.generate_auth_url(request_token)
		end
	end

	def approve_access_token(request_token, verifier) do
		case(Application.get_env(:elixero, :app_type)) do
			:private -> raise "Approving an access token is not applicable with Private applications"
			:public -> EliXero.Public.approve_access_token(request_token, verifier)
			:partner -> EliXero.Partner.approve_access_token(request_token, verifier)
		end
	end

	def renew_access_token(access_token) do
		case(Application.get_env(:elixero, :app_type)) do
			:private -> raise "Renewing an access token is not applicable with Private applications"
			:public -> raise "Renewing an access token is not applicable with Public applications"
			:partner -> EliXero.Partner.renew_access_token(access_token)
		end
	end

	def get(resource) do
		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.get(resource)
			:public -> raise "get/2 should be used with Public apps. An access token is required."
			:partner -> raise "get/2 should be used with Partner apps. An access token is required."
		end
	end

	def get(access_token, resource) do
		case(Application.get_env(:elixero, :app_type)) do
			:private -> raise "get/1 should be used with Private apps. No access token is required."
			:public -> EliXero.Public.get(access_token, resource)
			:partner -> EliXero.Partner.get(access_token, resource)
		end
	end	
end