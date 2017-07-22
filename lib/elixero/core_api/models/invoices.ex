defmodule EliXero.CoreApi.Models.Invoices do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "invoices" do
        embeds_many :Invoices, EliXero.CoreApi.Models.Invoices.Invoice
    end
end