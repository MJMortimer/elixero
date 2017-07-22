defmodule EliXero.CoreApi.Models.Receipts.Receipt do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

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
end