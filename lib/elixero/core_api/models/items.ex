defmodule EliXero.CoreApi.Models.Items do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "items" do
        embeds_many :Items, EliXero.CoreApi.Models.Items.Item
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Items)
        |> apply_changes
    end
end