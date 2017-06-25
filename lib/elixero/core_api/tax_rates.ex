defmodule EliXero.CoreApi.TaxRates do
  @resource "taxrates"

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
  end

  def find(client, identifier) do
    EliXero.CoreApi.Common.find(client, @resource, identifier)
  end

  def filter(client, filter) do
    EliXero.CoreApi.Common.filter(client, @resource, filter)
  end

  def create(client, tax_rates_map) do
    EliXero.CoreApi.Common.create(client, @resource, tax_rates_map)
  end

  def update(client, identifier, tax_rates_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, tax_rates_map)
  end
end