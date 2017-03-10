defmodule EliXero.CoreApi.Invoices do
	@api_type :core	
	@resource "invoices"

	def find(client) do
		EliXero.CoreApi.Common.find(client, @resource)
	end

	def find(client, identifier) do
		EliXero.CoreApi.Common.find(client, @resource, identifier)
	end

	def filter(client, filter) do
		EliXero.CoreApi.Common.filter(client, @resource, filter)
	end

	def create(client, expense_claims_map) do
		EliXero.CoreApi.Common.create(client, @resource, expense_claims_map)
	end

	def update(client, identifier, expense_claims_map) do
		EliXero.CoreApi.Common.update(client, @resource, identifier, expense_claims_map)
	end

	def online_invoice_url(client, identifier) do
		resource = @resource <> "/" <> identifier <> "/OnlineInvoice"

		case(Application.get_env(:elixero, :app_type)) do
			:private -> EliXero.Private.find(resource, @api_type)
			:public -> EliXero.Public.find(client.access_token, resource, @api_type)
			:partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
		end
	end
end