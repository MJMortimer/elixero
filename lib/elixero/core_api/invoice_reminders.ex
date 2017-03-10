defmodule EliXero.CoreApi.InvoiceReminders do
	@api_type :core	
	@resource "invoicereminders"

	def settings(client) do
		resource = @resource <> "/settings"

		EliXero.CoreApi.Common.find(client, resource)
	end
end