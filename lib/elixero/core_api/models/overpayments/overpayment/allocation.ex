defmodule EliXero.CoreApi.Models.Overpayments.Overpayment.Allocation do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "allocations" do
        embeds_one :Overpayment, EliXero.CoreApi.Models.Overpayments.Overpayment
        field :Amount, :decimal
        field :Date, :string
        embeds_one :Invoice, EliXero.CoreApi.Models.Invoices.Invoice
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end
end