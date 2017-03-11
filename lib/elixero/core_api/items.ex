defmodule EliXero.CoreApi.Items do
  @api_type :core  
  @resource "items"

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
  end

  def find(client, identifier) do
    EliXero.CoreApi.Common.find(client, @resource, identifier)
  end

  def filter(client, filter) do
    EliXero.CoreApi.Common.filter(client, @resource, filter)
  end

  def create(client, items_map) do
    EliXero.CoreApi.Common.create(client, @resource, items_map)
  end

  def update(client, identifier, items_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, items_map)
  end

  def delete(client, identifier) do
    EliXero.CoreApi.Common.delete(client, @resource, identifier)
  end
end