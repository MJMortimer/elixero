defmodule EliXero.CoreApi.BankTransfers do
	@api_type :core	
	@resource "banktransfers"

	def find(client) do
		EliXero.CoreApi.Common.find(client, @resource)
	end

	def find(client, identifier) do
		EliXero.CoreApi.Common.find(client, @resource, identifier)
	end

	def filter(client, filter) do
		EliXero.CoreApi.Common.filter(client, @resource, filter)
	end

	def create(client, bank_transfers_map) do
		EliXero.CoreApi.Common.create(client, @resource, bank_transfers_map)
	end
end