defmodule EliXero.CoreApi.Models.PurchaseOrders do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "purchaseorders" do
        embeds_many :PurchaseOrders, EliXero.CoreApi.Models.PurchaseOrders.PurchaseOrder
    end
end