defmodule EliXero.CoreApi.Organisations do
  @resource "organisations"
  @model_module EliXero.CoreApi.Models.Organisations

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end
end