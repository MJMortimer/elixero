defmodule EliXero.CoreApi.Models.BrandingThemes do
    use Ecto.Schema
    import Ecto.Changeset
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "brandingthemes" do
        embeds_many :BrandingThemes, EliXero.CoreApi.Models.BrandingThemes.BrandingTheme
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:BrandingThemes)
        |> apply_changes
    end
end