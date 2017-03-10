defmodule EliXero.CoreApi.TrackingCategories do
	@api_type :core	
	@resource "trackingcategories"

	def find(client) do
		EliXero.CoreApi.Common.find(client, @resource)
	end

	def find(client, identifier) do
		EliXero.CoreApi.Common.find(client, @resource, identifier)
	end

	def filter(client, filter) do
		EliXero.CoreApi.Common.filter(client, @resource, filter)
	end

	def create(client, categories_map) do
		EliXero.CoreApi.Common.create(client, @resource, categories_map)
	end

	def update(client, identifier, categories_map) do
		EliXero.CoreApi.Common.update(client, @resource, identifier, categories_map)
	end

	def delete(client, identifier) do
		EliXero.CoreApi.Common.delete(client, @resource, identifier)
	end

	def add_option(client, identifier, options_map) do
		resource = @resource <> identifier <> "/options"

		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.create(resource, @api_type, options_map)
			:public -> EliXero.Public.create(client.access_token, resource, @api_type, options_map)
			:partner -> EliXero.Partner.create(client.access_token, resource, @api_type, options_map)
		end
	end

	def update_option(client, category_identifier, option_identifier, options_map) do
		resource = @resource <> identifier <> "/options" <> option_identifier

		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.create(resource, @api_type, options_map)
			:public -> EliXero.Public.create(client.access_token, resource, @api_type, options_map)
			:partner -> EliXero.Partner.create(client.access_token, resource, @api_type, options_map)
		end
	end

	def delete_option(client, category_identifier, option_identifier) do
		resource = @resource <> identifier <> "/options" <> option_identifier

		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.delete(resource, @api_type)
			:public -> EliXero.Public.delete(client.access_token, resource, @api_type)
			:partner -> EliXero.Partner.delete(client.access_token, resource, @api_type)
		end
	end
end