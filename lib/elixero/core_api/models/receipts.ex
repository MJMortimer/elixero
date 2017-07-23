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

    def from_validation_exception(data) do
        remapped_data = %{:Receipts => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:Receipts)
        |> apply_changes
    end
end