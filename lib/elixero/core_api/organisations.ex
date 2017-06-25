defmodule EliXero.CoreApi.Organisations do
  @resource "organisations"

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
  end
end