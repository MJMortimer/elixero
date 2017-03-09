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

	def find(resource, api_type) do
		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.get(resource, api_type)
			:public -> raise "find/3 should be used with Public apps. An access token is required in addition to the resource and API type"
			:partner -> raise "find/3 should be used with Partner apps. An access token is required in addition to the resource and API type"
		end
	end

	def find(access_token, resource, api_type) do
		case(Application.get_env(:elixero, :app_type)) do
			:private -> raise "find/2 should be used with Private apps. Private apps require only the resource and API type"
			:public -> EliXero.Public.get(access_token, resource, api_type)
			:partner -> EliXero.Partner.get(access_token, resource, api_type)
		end
	end

	def create(resource, api_type, data_map) do
		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.create(resource, api_type, data_map)
			:public -> raise "create/4 should be used with Public apps. An access token is required in addition to the resource, API type and data map"
			:partner -> raise "create/4 should be used with Partner apps. An access token is required in addition to the resource, API type and data map"
		end
	end

	def create(access_token, resource, api_type, data_map) do
		case(Application.get_env(:elixero, :app_type)) do
			:private -> raise "create/3 should be used with Private apps. Private apps require only the resource, API type, and data map"
			:public -> EliXero.Public.create(access_token, resource, api_type, data_map)
			:partner -> EliXero.Partner.create(access_token, resource, api_type, data_map)
		end
	end		
end