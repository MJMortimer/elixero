defmodule EliXero.CoreApi.TrackingCategories do
  @api_type :core
  @resource "trackingcategories"
  @model_module EliXero.CoreApi.Models.TrackingCategories
  @options_model_module EliXero.CoreApi.Models.TrackingCategories.TrackingCategory.Options

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

  def create(client, categories_map) do
    EliXero.CoreApi.Common.create(client, @resource, categories_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def update(client, identifier, categories_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, categories_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def delete(client, identifier) do
    EliXero.CoreApi.Common.delete(client, @resource, identifier)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def add_option(client, identifier, options_map) do
    resource = @resource <> identifier <> "/options"

    case client.app_type do
      :private -> EliXero.Private.create(client.access_token, resource, @api_type, options_map)
      :public -> EliXero.Public.create(client.access_token, resource, @api_type, options_map)
      :partner -> EliXero.Partner.create(client.access_token, resource, @api_type, options_map)
    end
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@options_model_module)
  end

  def update_option(client, category_identifier, option_identifier, options_map) do
    resource = @resource <> category_identifier <> "/options" <> option_identifier

    case client.app_type do
      :private -> EliXero.Private.create(client.access_token, resource, @api_type, options_map)
      :public -> EliXero.Public.create(client.access_token, resource, @api_type, options_map)
      :partner -> EliXero.Partner.create(client.access_token, resource, @api_type, options_map)
    end
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@options_model_module)
  end

  def delete_option(client, category_identifier, option_identifier) do
    resource = @resource <> category_identifier <> "/options" <> option_identifier

    case client.app_type do
      :private -> EliXero.Private.delete(client.access_token, resource, @api_type)
      :public -> EliXero.Public.delete(client.access_token, resource, @api_type)
      :partner -> EliXero.Partner.delete(client.access_token, resource, @api_type)
    end
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@options_model_module)
  end
end