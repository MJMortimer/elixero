defmodule EliXero.CoreApi.Accounts do
  @resource "accounts"

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
  end

  def find(client, identifier) do
    EliXero.CoreApi.Common.find(client, @resource, identifier)
  end

  def filter(client, filter) do
    EliXero.CoreApi.Common.filter(client, @resource, filter)
  end

  def create(client, accounts_map) do
    EliXero.CoreApi.Common.create(client, @resource, accounts_map)
  end

  def update(client, identifier, accounts_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, accounts_map)
  end

  def delete(client, identifier) do
    EliXero.CoreApi.Common.delete(client, @resource, identifier)
  end
end