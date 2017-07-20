defmodule EliXero.CoreApi.Contacts do
  @resource "contacts"

  def find(client) do
    response = EliXero.CoreApi.Common.find(client, @resource)
    as_contacts response.body
  end

  def find(client, identifier) do
    response = EliXero.CoreApi.Common.find(client, @resource, identifier)
    as_contacts response.body
  end

  def filter(client, filter) do
    response = EliXero.CoreApi.Common.filter(client, @resource, filter)
    as_contacts response.body
  end

  def create(client, contacts_map) do
    response = EliXero.CoreApi.Common.create(client, @resource, contacts_map)
    as_contacts response.body
  end

  def update(client, identifier, contacts_map) do
    response = EliXero.CoreApi.Common.update(client, @resource, identifier, contacts_map)
    as_contacts response.body
  end

  defp as_contacts(json_body) do
    EliXero.CoreApi.Models.Contacts.from_json_string json_body
  end
end