defmodule EliXero.CoreApi.ManualJournals do
  @resource "manualjournals"

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
  end

  def find(client, identifier) do
    EliXero.CoreApi.Common.find(client, @resource, identifier)
  end

  def filter(client, filter) do
    EliXero.CoreApi.Common.filter(client, @resource, filter)
  end

  def create(client, manual_journals_map) do
    EliXero.CoreApi.Common.create(client, @resource, manual_journals_map)
  end

  def update(client, identifier, manual_journals_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, manual_journals_map)
  end
end