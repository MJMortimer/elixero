defmodule EliXero.CoreApi.Models.InvoiceReminders do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "invoiceReminders" do
        embeds_many :InvoiceReminders, EliXero.CoreApi.Models.InvoiceReminders.InvoiceReminder
    end
end