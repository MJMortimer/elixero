defmodule EliXero.CoreApi.Reports do
	@api_type :core	
	@resource "reports"

	def find(client) do
		EliXero.CoreApi.Common.find(client, @resource)
	end

	def named(client, name) do
		resource = @resource <> "/" <> name

		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.find(resource, @api_type)
			:public -> EliXero.Public.find(client.access_token, resource, @api_type)
			:partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
		end
	end

	def named(client, name, filter) do
		resource = @resource <> "/" <> name <> "?" <> filter

		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.find(resource, @api_type)
			:public -> EliXero.Public.find(client.access_token, resource, @api_type)
			:partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
		end
	end

	def individual_report(client, identifier) do
		resource = @resource <> "/" <> identifier

		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.find(resource, @api_type)
			:public -> EliXero.Public.find(client.access_token, resource, @api_type)
			:partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
		end
	end
endS