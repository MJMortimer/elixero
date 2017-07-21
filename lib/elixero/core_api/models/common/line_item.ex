defmodule EliXero.CoreApi.Models.Common.LineItem do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "lineitems" do
        field :LineItemID, Ecto.UUID
        field :Description, :string
        field :Quantity, :decimal
        field :UnitAmount, :decimal
        field :AccountCode, :string
        field :ItemCode, :string
        field :TaxType, :string
        field :TaxAmount, :decimal
        field :LineAmount, :decimal
        field :DiscountRate, :decimal
        embeds_many :Tracking, EliXero.CoreApi.Models.Common.LineItems.TrackingCategory
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string        
    end
end