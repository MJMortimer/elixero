defmodule EliXero.CoreApi.Accounts do
	@api_type :core	
	@resource "accounts"

	def find(client) do
		EliXero.CoreApi.Common.find(client, @resource)
	end

	def find_filtered(client, filter) do
		EliXero.CoreApi.Common.find_filtered(client, @resource, filter)
	end

	def find_single(client, identifier) do
		EliXero.CoreApi.Common.find_single(client, @resource, identifier)
	end

	def create(client, accounts_map) do
		EliXero.CoreApi.Common.create(client, @resource, accounts_map)
	end

	def update(client, identifier, accounts_map) do
		EliXero.CoreApi.Common.update(client, @resource, identifier, accounts_map)
	end
end