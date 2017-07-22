defmodule EliXero.CoreApi.Models.Prepayments.Prepayment do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "prepayments" do
        field :PrepaymentID, Ecto.UUID
        embeds_one :Contact, EliXero.CoreApi.Models.Contacts.Contact
        field :Date, :string
        field :Status, :string
        field :LineAmountTypes, :string
        embeds_many :LineItems, EliXero.CoreApi.Models.Common.LineItem
        field :SubTotal, :decimal
        field :TotalTax, :decimal
        field :Total, :decimal
        field :CurrencyCode, :string
        field :CurrencyRate, :decimal
        field :Type, :string
        field :RemainingCredit, :decimal
        field :HasAttachments, :boolean
        embeds_many :Allocations, EliXero.CoreApi.Models.Prepayments.Prepayment.Allocation
        embeds_many :Payments, EliXero.CoreApi.Models.Payments.Payment
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string 
    end
end