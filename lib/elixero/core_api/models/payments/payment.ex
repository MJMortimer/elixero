defmodule EliXero.CoreApi.Models.Payments.Payment do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "payments" do
        field :PaymentID, Ecto.UUID
        field :PaymentType, :string
        field :Status, :string
        field :Date, :string
        field :CurrencyRate, :decimal
        field :BankAmount, :decimal
        field :Amount, :decimal
        field :Reference, :string
        field :IsReconciled, :boolean
        embeds_one :Invoice, EliXero.CoreApi.Models.Invoices.Invoice
        embeds_one :CreditNote, EliXero.CoreApi.Models.CreditNotes.CreditNote
        embeds_one :Prepayment, EliXero.CoreApi.Models.Prepayments.Prepayment
        embeds_one :Overpayment, EliXero.CoreApi.Models.Overpayments.Overpayment
        embeds_one :Account, EliXero.CoreApi.Models.Accounts.Account
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string        
    end
end