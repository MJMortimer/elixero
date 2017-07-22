defmodule EliXero.CoreApi.Models.Receipts do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "receipts" do
        embeds_many :Receipts, EliXero.CoreApi.Models.Receipts.Receipt
    end
end