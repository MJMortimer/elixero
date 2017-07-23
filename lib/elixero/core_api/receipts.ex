defmodule EliXero.CoreApi.Receipts do
  @resource "receipts"
  @model_module EliXero.CoreApi.Models.Receipts

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def find(client, identifier) do
    EliXero.CoreApi.Common.find(client, @resource, identifier)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def filter(client, filter) do
    EliXero.CoreApi.Common.filter(client, @resource, filter)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def create(client, receipts_map) do
    EliXero.CoreApi.Common.create(client, @resource, receipts_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def update(client, identifier, receipts_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, receipts_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end
end