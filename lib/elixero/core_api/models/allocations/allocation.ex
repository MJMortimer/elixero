defmodule EliXero.CoreApi.Models.Allocations.Allocation do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "allocations" do
        embeds_one :CreditNote, EliXero.CoreApi.Models.CreditNotes.CreditNote        
        embeds_one :Prepayment, EliXero.CoreApi.Models.Prepayments.Prepayment
        embeds_one :Overpayment, EliXero.CoreApi.Models.Overpayments.Overpayment
        field :Amount, :decimal
        field :Date, :string
        embeds_one :Invoice, EliXero.CoreApi.Models.Invoices.Invoice
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end

    def changeset(struct, data) do
        struct
        |> cast(data, [:Amount, :Date, :StatusAttributeString])
        |> cast_embed(:CreditNote)
        |> cast_embed(:Prepayment)
        |> cast_embed(:Overpayment)
        |> cast_embed(:Invoice)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end