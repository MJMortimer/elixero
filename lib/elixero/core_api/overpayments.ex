defmodule EliXero.CoreApi.Overpayments do
  @resource "overpayments"
  @model_module EliXero.CoreApi.Models.Overpayments
  @allocations_model_module EliXero.CoreApi.Models.Allocations

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

  def allocate_overpayment(client, identifier, allocations_map) do
    resource = @resource <> "/" <> identifier <> "/allocations"
    
    EliXero.CoreApi.Common.create(client, resource, allocations_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@allocations_model_module)
  end
end