defmodule EliXero.CoreApi.LinkedTransactions do
	@api_type :core	
	@resource "linkedtransactions"

	def find(client) do
		EliXero.CoreApi.Common.find(client, @resource)
	end

	def find(client, identifier) do
		EliXero.CoreApi.Common.find(client, @resource, identifier)
	end

	def filter(client, filter) do
		EliXero.CoreApi.Common.filter(client, @resource, filter)
	end

	def create(client, linked_transactions_map) do
		EliXero.CoreApi.Common.create(client, @resource, linked_transactions_map)
	end

	def update(client, identifier, linked_transactions_map) do
		EliXero.CoreApi.Common.update(client, @resource, identifier, linked_transactions_map)
	end

	def delete(client, identifier) do
		EliXero.CoreApi.Common.delete(client, @resource, identifier)
	end
end