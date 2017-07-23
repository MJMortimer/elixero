defmodule EliXero.CoreApi.Models.Organisations do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "organisations" do
        embeds_many :Organisations, EliXero.CoreApi.Models.Organisations.Organisation
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Organisations)
        |> apply_changes
    end
end