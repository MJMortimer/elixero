defmodule EliXero.CoreApi.Models.Prepayments.Prepayment.Allocation do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "allocations" do
        embeds_one :Prepayment, EliXero.CoreApi.Models.Prepayments.Prepayment
        field :Amount, :decimal
        field :Date, :string
        embeds_one :Invoice, EliXero.CoreApi.Models.Invoices.Invoice
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end
end