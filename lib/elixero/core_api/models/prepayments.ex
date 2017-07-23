defmodule EliXero.CoreApi.Models.Prepayments do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "prepayments" do
        embeds_many :Prepayments, EliXero.CoreApi.Models.Prepayments.Prepayment
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Prepayments)
        |> apply_changes
    end
end