defmodule EliXero.CoreApi.ExpenseClaims do
  @api_type :core
  @resource "expenseclaims"

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
  end

  def find(client, identifier) do
    EliXero.CoreApi.Common.find(client, @resource, identifier)
  end

  def filter(client, filter) do
    EliXero.CoreApi.Common.filter(client, @resource, filter)
  end

  def create(client, expense_claims_map) do
    EliXero.CoreApi.Common.create(client, @resource, expense_claims_map)
  end

  def update(client, identifier, expense_claims_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, expense_claims_map)
  end
end