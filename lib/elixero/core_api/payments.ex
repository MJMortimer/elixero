defmodule EliXero.CoreApi.Payments do
	@api_type :core	
	@resource "payments"

	def find(client) do
		EliXero.CoreApi.Common.find(client, @resource)
	end

	def find(client, identifier) do
		EliXero.CoreApi.Common.find(client, @resource, identifier)
	end

	def filter(client, filter) do
		EliXero.CoreApi.Common.filter(client, @resource, filter)
	end

	def create(client, payments_map) do
		EliXero.CoreApi.Common.create(client, @resource, payments_map)
	end

	def update(client, identifier, payments_map) do
		EliXero.CoreApi.Common.update(client, @resource, identifier, payments_map)
	end
end