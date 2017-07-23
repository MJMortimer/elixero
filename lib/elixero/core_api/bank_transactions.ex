defmodule EliXero.CoreApi.BankTransactions do
  @resource "banktransactions"
  @model_module EliXero.CoreApi.Models.BankTransactions

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

  def create(client, bank_transactions_map) do
    EliXero.CoreApi.Common.create(client, @resource, bank_transactions_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def update(client, identifier, bank_transactions_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, bank_transactions_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end
end