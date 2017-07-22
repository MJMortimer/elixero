defmodule EliXero.CoreApi.Models.Items.Item do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "items" do
        field :ItemID, Ecto.UUID
        field :Code, :string
        field :Description, :string
        embeds_one :PurchaseDetails, EliXero.CoreApi.Models.Items.Item.ItemDetails
        embeds_one :SalesDetails, EliXero.CoreApi.Models.Items.Item.ItemDetails
        field :InventoryAssetAccountCode, :string
        field :QuantityOnHand, :decimal
        field :IsSold, :boolean
        field :IsPurchased, :boolean
        field :PurchaseDescription, :string
        field :IsTrackedAsInventory, :boolean
        field :TotalCostPool, :decimal
        field :Name, :string
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string   
    end
end