defmodule EliXero.CoreApi.Models.Overpayments.Overpayment do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :OverpaymentID,
        :Date,
        :Status,
        :LineAmountTypes,
        :SubTotal,
        :TotalTax,
        :Total,
        :CurrencyCode,
        :CurrencyRate,
        :Type,
        :RemainingCredit,
        :HasAttachments,
        :UpdatedDateUTC,
        :StatusAttributeString
    ]

    schema "overpayments" do
        field :OverpaymentID, Ecto.UUID
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
        embeds_many :Allocations, EliXero.CoreApi.Models.Allocations.Allocation
        embeds_many :Payments, EliXero.CoreApi.Models.Payments.Payment
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string 
    end

    def changeset(struct, data) do
        struct
        |> cast(data, @fields)
        |> cast_embed(:Contact)
        |> cast_embed(:LineItems)
        |> cast_embed(:Allocations)
        |> cast_embed(:Payments)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end