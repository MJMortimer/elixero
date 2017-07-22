defmodule EliXero.CoreApi.Models.PurchaseOrders.PurchaseOrder do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "purchaseorders" do
        field :PurchaseOrderID, Ecto.UUID
        field :PurchaseOrderNumber, :string
        field :Date, :string
        field :DeliveryDate, :string
        field :ExpectedArrivalDate, :string
        field :DeliveryAddress, :string
        field :AttentionTo, :string
        field :Telephone, :string
        field :DeliveryInstructions, :string
        field :TotalDiscount, :decimal
        field :SentToContact, :boolean
        field :Reference, :string
        field :CurrencyCode, :string
        field :CurrencyRate, :decimal
        embeds_one :Contact, EliXero.CoreApi.Models.Contacts.Contact
        field :BrandingThemeID, Ecto.UUID
        field :Status, :string
        field :LineAmountTypes, :string
        embeds_many :LineItems, EliXero.CoreApi.Models.Common.LineItem
        field :SubTotal, :decimal
        field :TotalTax, :decimal
        field :Total, :decimal    
        field :HasAttachments, :boolean
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string        
    end
end