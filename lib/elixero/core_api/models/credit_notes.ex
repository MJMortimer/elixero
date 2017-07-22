defmodule EliXero.CoreApi.Models.CreditNotes do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "creditnotes" do
        embeds_many :CreditNotes, EliXero.CoreApi.Models.CreditNotes.CreditNote
    end
end