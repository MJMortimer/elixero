defmodule EliXero.CoreApi.Common do
  @api_type :core

  def find(client, resource) do
    case(Application.get_env(:elixero, :app_type)) do
      :private -> EliXero.Private.find(resource, @api_type)
      :public -> EliXero.Public.find(client.access_token, resource, @api_type)
      :partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
    end
  end

  def find(client, resource,  identifier) do
    resource = resource <> "/" <> identifier

    find(client, resource)
  end

  def filter(client, resource, filter) do
    resource = resource <> "?" <> filter

    find(client, resource)
  end

  def create(client, resource, object_map) do
    case(Application.get_env(:elixero, :app_type)) do
      :private -> EliXero.Private.create(resource, @api_type, object_map)
      :public -> EliXero.Public.create(client.access_token, resource, @api_type, object_map)
      :partner -> EliXero.Partner.create(client.access_token, resource, @api_type, object_map)
    end
  end

  def update(client, resource, identifier, object_map) do
    resource = resource <> "/" <> identifier

    case(Application.get_env(:elixero, :app_type)) do
      :private -> EliXero.Private.update(resource, @api_type, object_map)
      :public -> EliXero.Public.update(client.access_token, resource, @api_type, object_map)
      :partner -> EliXero.Partner.update(client.access_token, resource, @api_type, object_map)
    end
  end

  def delete(client, resource, identifier) do
    resource = resource <> "/" <> identifier

    case(Application.get_env(:elixero, :app_type)) do
      :private -> EliXero.Private.delete(resource, @api_type)
      :public -> EliXero.Public.find(client.access_token, resource, @api_type)
      :partner -> EliXero.Partner.find(client.access_token, resource, @api_type)
    end
  end
end