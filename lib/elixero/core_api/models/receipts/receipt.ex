defmodule EliXero.CoreApi.Models.Receipts.Receipt do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :ReceiptID,
        :Date,
        :Reference,
        :LineAmountTypes,
        :SubTotal,
        :TotalTax,
        :Total,
        :Status,
        :ReceiptNumber,
        :HasAttachments,
        :Url,
        :UpdatedDateUTC,
        :StatusAttributeString
    ]

    schema "receipts" do
        field :ReceiptID, Ecto.UUID
        field :Date, :string
        embeds_one :Contact, EliXero.CoreApi.Models.Contacts.Contact
        embeds_many :LineItems, EliXero.CoreApi.Models.Common.LineItem
        embeds_one :User, EliXero.CoreApi.Models.Users.User
        field :Reference, :string
        field :LineAmountTypes, :string
        field :SubTotal, :decimal
        field :TotalTax, :decimal
        field :Total, :decimal
        field :Status, :string
        field :ReceiptNumber, :string
        field :HasAttachments, :boolean
        field :Url, :string
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
        |> cast_embed(:User)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end