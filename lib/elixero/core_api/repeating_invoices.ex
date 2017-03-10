defmodule EliXero.CoreApi.RepeatingInvoices do
	@api_type :core	
	@resource "repeatinginvoices"

	def find(client) do
		EliXero.CoreApi.Common.find(client, @resource)
	end

	def find(client, identifier) do
		EliXero.CoreApi.Common.find(client, @resource, identifier)
	end

	def filter(client, filter) do
		EliXero.CoreApi.Common.filter(client, @resource, filter)
	end
end