defmodule EliXero.CoreApi.InvoiceReminders do
  @resource "invoicereminders"
  @model_module EliXero.CoreApi.Models.InvoiceReminders

  def settings(client) do
    resource = @resource <> "/settings"

    EliXero.CoreApi.Common.find(client, resource)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end
end