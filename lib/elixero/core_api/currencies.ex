defmodule EliXero.CoreApi.Currencies do
  @resource "currencies"

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
  end

  def filter(client, filter) do
    EliXero.CoreApi.Common.filter(client, @resource, filter)
  end
end