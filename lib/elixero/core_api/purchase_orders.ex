defmodule EliXero.CoreApi.PurchaseOrders do
  @api_type :core
  @resource "purchaseorders"

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
  end

  def find(client, identifier) do
    EliXero.CoreApi.Common.find(client, @resource, identifier)
  end

  def filter(client, filter) do
    EliXero.CoreApi.Common.filter(client, @resource, filter)
  end

  def create(client, purchase_orders_map) do
    EliXero.CoreApi.Common.create(client, @resource, purchase_orders_map)
  end

  def update(client, identifier, purchase_orders_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, purchase_orders_map)
  end
end