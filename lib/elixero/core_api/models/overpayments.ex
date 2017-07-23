defmodule EliXero.CoreApi.Models.Overpayments do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "overpayments" do
        embeds_many :Overpayments, EliXero.CoreApi.Models.Overpayments.Overpayment
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Overpayments)
        |> apply_changes
    end
end