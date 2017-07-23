defmodule EliXero.CoreApi.Models.Receipts do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "receipts" do
        embeds_many :Receipts, EliXero.CoreApi.Models.Receipts.Receipt
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Receipts)
        |> apply_changes
    end
end