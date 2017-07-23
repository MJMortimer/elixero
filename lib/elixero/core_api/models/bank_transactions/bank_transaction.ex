defmodule EliXero.CoreApi.Models.BankTransactions.BankTransaction do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :BankTransactionID,
        :Type,
        :Status,
        :LineAmountTypes,
        :IsReconciled,
        :Date,
        :Reference,
        :CurrencyRate,
        :CurrencyCode,
        :Url,
        :SubTotal,
        :TotalTax,
        :Total,
        :HasAttachments,
        :PrepaymentID,
        :OverpaymentID,
        :UpdatedDateUTC,
        :StatusAttributeString
    ]

    schema "banktransactions" do
        field :BankTransactionID, Ecto.UUID
        embeds_one :Contact, EliXero.CoreApi.Models.Contacts.Contact
        embeds_one :BankAccount, EliXero.CoreApi.Models.Accounts.Account
        field :Type, :string
        field :Status, :string
        field :LineAmountTypes, :string
        field :IsReconciled, :boolean
        field :Date, :string
        field :Reference, :string
        field :CurrencyRate, :decimal
        field :CurrencyCode, :string
        field :Url, :string
        field :SubTotal, :decimal
        field :TotalTax, :decimal
        field :Total, :decimal
        field :HasAttachments, :boolean
        embeds_many :LineItems, EliXero.CoreApi.Models.Common.LineItem
        field :PrepaymentID, Ecto.UUID
        field :OverpaymentID, Ecto.UUID
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string  
    end

    def changeset(struct, data) do
        struct
        |> cast(data, @fields)
        |> cast_embed(:Contact)
        |> cast_embed(:BankAccount)
        |> cast_embed(:LineItems)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end