defmodule EliXero.CoreApi.Reports do
  @api_type :core
  @resource "reports"
  @model_module EliXero.CoreApi.Models.Reports

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def named(client, name) do
    resource = @resource <> "/" <> name

    case client.app_type do
      :private -> EliXero.Private.find(client.access_token, resource, @api_type)
      :public -> EliXero.Public.find(client.access_token, resource, @api_type)
      :partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
    end
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def named(client, name, filter) do
    resource = @resource <> "/" <> name <> "?" <> filter

    case client.app_type do
      :private -> EliXero.Private.find(client.access_token, resource, @api_type)
      :public -> EliXero.Public.find(client.access_token, resource, @api_type)
      :partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
    end
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def individual_report(client, identifier) do
    resource = @resource <> "/" <> identifier

    case client.app_type do
      :private -> EliXero.Private.find(client.access_token, resource, @api_type)
      :public -> EliXero.Public.find(client.access_token, resource, @api_type)
      :partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
    end
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end
end