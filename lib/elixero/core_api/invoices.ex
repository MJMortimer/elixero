defmodule EliXero.CoreApi.Invoices do
  @api_type :core
  @resource "invoices"
  @model_module EliXero.CoreApi.Models.Invoices
  @online_invoices_model_module EliXero.CoreApi.Models.OnlineInvoices

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

  def create(client, invoices_map) do
    EliXero.CoreApi.Common.create(client, @resource, invoices_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def update(client, identifier, invoices_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, invoices_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def online_invoice_url(client, identifier) do
    resource = @resource <> "/" <> identifier <> "/OnlineInvoice"

    case client.app_type do
      :private -> EliXero.Private.find(client.access_token, resource, @api_type)
      :public -> EliXero.Public.find(client.access_token, resource, @api_type)
      :partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
    end
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@online_invoices_model_module)
  end
end