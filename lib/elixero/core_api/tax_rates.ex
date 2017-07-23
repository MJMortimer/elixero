defmodule EliXero.CoreApi.TaxRates do
  @resource "taxrates"
  @model_module EliXero.CoreApi.Models.TaxRates

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

  def create(client, tax_rates_map) do
    EliXero.CoreApi.Common.create(client, @resource, tax_rates_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def update(client, identifier, tax_rates_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, tax_rates_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end
end