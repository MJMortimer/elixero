defmodule EliXero.CoreApi.Models.InvoiceReminders.InvoiceReminder do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "invoiceReminders" do
        field :Enabled, :boolean
    end
end