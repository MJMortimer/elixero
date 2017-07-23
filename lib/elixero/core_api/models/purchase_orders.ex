defmodule EliXero.CoreApi.Models.PurchaseOrders do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "purchaseorders" do
        embeds_many :PurchaseOrders, EliXero.CoreApi.Models.PurchaseOrders.PurchaseOrder
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:PurchaseOrders)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:PurchaseOrders => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:PurchaseOrders)
        |> apply_changes
    end
end