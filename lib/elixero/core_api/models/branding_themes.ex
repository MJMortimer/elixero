defmodule EliXero.CoreApi.Models.BrandingThemes do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "brandingthemes" do
        embeds_many :BrandingThemes, EliXero.CoreApi.Models.BrandingThemes.BrandingTheme
    end
end