defmodule EliXero.CoreApi.CreditNotes do
  @resource "creditnotes"

  def find(client) do
    EliXero.CoreApi.Common.find(client, @resource)
  end

  def find(client, identifier) do
    EliXero.CoreApi.Common.find(client, @resource, identifier)
  end

  def filter(client, filter) do
    EliXero.CoreApi.Common.filter(client, @resource, filter)
  end

  def create(client, credit_notes_map) do
    EliXero.CoreApi.Common.create(client, @resource, credit_notes_map)
  end

  def update(client, identifier, credit_notes_map) do
    EliXero.CoreApi.Common.update(client, @resource, identifier, credit_notes_map)
  end

  def allocate_credit_note(client, identifier, allocations_map) do
    resource = @resource <> "/" <> identifier <> "/allocations"
    EliXero.CoreApi.Common.create(client, resource, allocations_map)
  end
end