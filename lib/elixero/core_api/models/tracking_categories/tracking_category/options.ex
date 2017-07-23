defmodule EliXero.CoreApi.Models.TrackingCategories.TrackingCategory.Options do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "options" do
        embeds_many :Options, EliXero.CoreApi.Models.TrackingCategories.TrackingCategory.Options.Option
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Options)
        |> apply_changes
    end
end