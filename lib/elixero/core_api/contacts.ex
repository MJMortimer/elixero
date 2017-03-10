defmodule EliXero.CoreApi.Contacts do
	@api_type :core	
	@resource "contacts"

	def find(client) do
		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.find(@resource, @api_type)
			:public -> EliXero.Public.find(client.access_token, @resource, @api_type)
			:partner -> EliXero.Partner.find(client.access_token, @resource, @api_type)
		end
	end

	def find_filtered(client, filter) do
		resource = @resource <> "?" <> filter

		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.find(resource, @api_type)
			:public -> EliXero.Public.find(client.access_token, resource, @api_type)
			:partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
		end
	end

	def find_single(client, identifier) do
		resource = @resource <> "/" <> identifier

		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.find(resource, @api_type)
			:public -> EliXero.Public.find(client.access_token, resource, @api_type)
			:partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
		end
	end

	def create(client, contacts_map) do
		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.create(@resource, @api_type, contacts_map)
			:public -> EliXero.Public.create(client.access_token, @resource, @api_type, contacts_map)
			:partner -> EliXero.Partner.create(client.access_token, @resource, @api_type, contacts_map)
		end
	end
end