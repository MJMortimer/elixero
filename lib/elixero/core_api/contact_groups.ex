defmodule EliXero.CoreApi.ContactGroups do
  @api_type :core
  @resource "contactgroups"
  @model_module EliXero.CoreApi.Models.ContactGroups
  @contacts_model_module EliXero.CoreApi.Models.Contacts

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

  def create(client, contact_groups_map) do
    EliXero.CoreApi.Common.create(client, @resource, contact_groups_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def update(client, identifier, contact_groups_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, contact_groups_map)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def add_to_group(client, identifier, contacts_map) do
    resource = @resource <> "/" <> identifier <> "/contacts"

    case client.app_type do
      :private -> EliXero.Private.create(client.access_token, resource, @api_type, contacts_map)
      :public -> EliXero.Public.create(client.access_token, resource, @api_type, contacts_map)
      :partner -> EliXero.Partner.create(client.access_token, resource, @api_type, contacts_map)
    end
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@contacts_model_module)    
  end

  def remove_contact(client, contact_group_identifier, contact_identifier) do
    resource = @resource <> "/" <> contact_group_identifier <> "/contacts/" <> contact_identifier

    case client.app_type do
      :private -> EliXero.Private.delete(client.access_token, resource, @api_type)
      :public -> EliXero.Public.delete(client.access_token, resource, @api_type)
      :partner -> EliXero.Partner.delete(client.access_token, resource, @api_type)
    end
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)  
  end

  def remove_all_contacts(client, identifier) do
    resource = @resource <> "/" <> identifier <> "/contacts"

    case client.app_type do
      :private -> EliXero.Private.delete(client.access_token, resource, @api_type)
      :public -> EliXero.Public.delete(client.access_token, resource, @api_type)
      :partner -> EliXero.Partner.delete(client.access_token, resource, @api_type)
    end
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)  
  end
end