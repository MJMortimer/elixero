defmodule EliXero.CoreApi.Contacts do
	@api_type :core	
	@resource "contacts"

	def find(client) do
		EliXero.CoreApi.Common.find(client, @resource)
	end

	def find(client, identifier) do
		EliXero.CoreApi.Common.find(client, @resource, identifier)
	end

	def filter(client, filter) do
		EliXero.CoreApi.Common.filter(client, @resource, filter)
	end

	def create(client, contacts_map) do
		EliXero.CoreApi.Common.create(client, @resource, contacts_map)
	end

	def update(client, identifier, contacts_map) do
		EliXero.CoreApi.Common.update(client, @resource, identifier, contacts_map)
	end
end