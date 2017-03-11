defmodule EliXero.CoreApi.Receipts do
  @api_type :core
  @resource "receipts"

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
  end

  def find(client, identifier) do
    EliXero.CoreApi.Common.find(client, @resource, identifier)
  end

  def filter(client, filter) do
    EliXero.CoreApi.Common.filter(client, @resource, filter)
  end

  def create(client, receipts_map) do
    EliXero.CoreApi.Common.create(client, @resource, receipts_map)
  end

  def update(client, identifier, receipts_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, receipts_map)
  end
end