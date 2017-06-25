defmodule EliXero.CoreApi.BankTransactions do
  @resource "banktransactions"

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
  end

  def find(client, identifier) do
    EliXero.CoreApi.Common.find(client, @resource, identifier)
  end

  def filter(client, filter) do
    EliXero.CoreApi.Common.filter(client, @resource, filter)
  end

  def create(client, bank_transactions_map) do
    EliXero.CoreApi.Common.create(client, @resource, bank_transactions_map)
  end

  def update(client, identifier, bank_transactions_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, bank_transactions_map)
  end
end