defmodule EliXero.CoreApi.Contacts do
  @resource "contacts"
  @model_module EliXero.CoreApi.Models.Contacts

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

  def create(client, contacts_map) do
    EliXero.CoreApi.Common.create(client, @resource, contacts_map) 
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def update(client, identifier, contacts_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, contacts_map) 
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end
end