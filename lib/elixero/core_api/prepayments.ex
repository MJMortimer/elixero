defmodule EliXero.CoreApi.Prepayments do
  @api_type :core
  @resource "prepayments"

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
  end

  def find(client, identifier) do
    EliXero.CoreApi.Common.find(client, @resource, identifier)
  end

  def filter(client, filter) do
    EliXero.CoreApi.Common.filter(client, @resource, filter)
  end

  def allocate_prepayment(client, allocations_map) do
    EliXero.CoreApi.Common.create(client, @resource, allocations_map)
  end
end