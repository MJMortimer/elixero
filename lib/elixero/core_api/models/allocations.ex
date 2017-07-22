defmodule EliXero.CoreApi.Models.Allocations do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "allocations" do
        embeds_many :Allocations, EliXero.CoreApi.Models.Allocations.Allocation
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Allocations)
        |> apply_changes
    end
end