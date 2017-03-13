defmodule EliXero.CoreApi.Common do
  @api_type :core

  def find(client, resource) do
    case client.app_type do
      :private -> EliXero.Private.find(client.access_token, resource, @api_type)
      :public -> EliXero.Public.find(client.access_token, resource, @api_type)
      :partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
    end
  end

  def find(client, resource,  identifier) do
    resource = resource <> "/" <> identifier

    find(client, resource)
  end

  def filter(client, resource, filter) do
    query_filters = filter[:query_filters]

    extra_headers = 
      unless filter[:modified_since] == nil do
        [ {"if-modified-since", filter[:modified_since]} ] 
      else
        []
      end      

    case client.app_type do
      :private -> EliXero.Private.find(client.access_token, resource, @api_type, query_filters, extra_headers)
      :public -> EliXero.Public.find(client.access_token, resource, @api_type, query_filters, extra_headers)
      :partner -> EliXero.Partner.find(client.access_token, resource, @api_type, query_filters, extra_headers)
    end
  end

  def create(client, resource, object_map) do
    case client.app_type do
      :private -> EliXero.Private.create(client.access_token, resource, @api_type, object_map)
      :public -> EliXero.Public.create(client.access_token, resource, @api_type, object_map)
      :partner -> EliXero.Partner.create(client.access_token, resource, @api_type, object_map)
    end
  end

  def update(client, resource, identifier, object_map) do
    resource = resource <> "/" <> identifier

    case client.app_type do
      :private -> EliXero.Private.update(client.access_token, resource, @api_type, object_map)
      :public -> EliXero.Public.update(client.access_token, resource, @api_type, object_map)
      :partner -> EliXero.Partner.update(client.access_token, resource, @api_type, object_map)
    end
  end

  def delete(client, resource, identifier) do
    resource = resource <> "/" <> identifier

    case client.app_type do
      :private -> EliXero.Private.delete(client.access_token, resource, @api_type)
      :public -> EliXero.Public.find(client.access_token, resource, @api_type)
      :partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
    end
  end
end