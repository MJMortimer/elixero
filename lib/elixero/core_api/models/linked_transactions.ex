defmodule EliXero.CoreApi.Models.LinkedTransactions do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "linkedtransactions" do
        embeds_many :LinkedTransactions, EliXero.CoreApi.Models.LinkedTransactions.LinkedTransaction
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:LinkedTransactions)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:LinkedTransactions => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:LinkedTransactions)
        |> apply_changes
    end
end