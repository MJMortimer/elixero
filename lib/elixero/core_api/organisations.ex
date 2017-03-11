defmodule EliXero.CoreApi.Organisations do
  @api_type :core
  @resource "organisations"

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
  end
end