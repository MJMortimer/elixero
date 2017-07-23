defmodule EliXero.CoreApi.Models.RepeatingInvoices.RepeatingInvoice do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :RepeatingInvoiceID,
        :Type,
        :LineAmountTypes,
        :Reference,
        :BrandingThemeID,
        :CurrencyCode,
        :Status,
        :SubTotal,
        :TotalTax,
        :Total,   
        :HasAttachments,
        :StatusAttributeString
    ]

    schema "repeatinginvoices" do
        field :RepeatingInvoiceID, Ecto.UUID
        field :Type, :string
        embeds_one :Contact, EliXero.CoreApi.Models.Contacts.Contact
        embeds_one :Schedule, EliXero.CoreApi.Models.RepeatingInvoices.RepeatingInvoice.Schedule
        embeds_many :LineItems, EliXero.CoreApi.Models.Common.LineItem
        field :LineAmountTypes, :string
        field :Reference, :string
        field :BrandingThemeID, Ecto.UUID
        field :CurrencyCode, :string
        field :Status, :string
        field :SubTotal, :decimal
        field :TotalTax, :decimal
        field :Total, :decimal    
        field :HasAttachments, :boolean
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string        
    end

    def changeset(struct, data) do
        struct
        |> cast(data, @fields)
        |> cast_embed(:Contact)
        |> cast_embed(:Schedule)
        |> cast_embed(:LineItems)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end