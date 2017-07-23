defmodule EliXero.CoreApi.ExpenseClaims do
  @resource "expenseclaims"
  @model_module EliXero.CoreApi.Models.ExpenseClaims

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

  def create(client, expense_claims_map) do
    EliXero.CoreApi.Common.create(client, @resource, expense_claims_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def update(client, identifier, expense_claims_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, expense_claims_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end
end