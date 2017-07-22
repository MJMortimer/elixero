defmodule EliXero.CoreApi.Models.RepeatingInvoices do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "repeatinginvoices" do
        embeds_many :Accounts, EliXero.CoreApi.Models.RepeatingInvoices.RepeatingInvoice
    end
end