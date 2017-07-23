defmodule EliXero.CoreApi.Models.Items.Item do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :ItemID,
        :Code,
        :Description,
        :InventoryAssetAccountCode,
        :QuantityOnHand,
        :IsSold,
        :IsPurchased,
        :PurchaseDescription,
        :IsTrackedAsInventory,
        :TotalCostPool,
        :Name,
        :UpdatedDateUTC,
        :StatusAttributeString
    ]

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

    def changeset(struct, data) do
        struct
        |> cast(data, @fields)
        |> cast_embed(:PurchaseDetails)
        |> cast_embed(:SalesDetails)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end