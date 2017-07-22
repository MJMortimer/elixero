defmodule EliXero.CoreApi.Models.BrandingThemes.BrandingTheme do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "brandingthemes" do
        field :BrandingThemeID, Ecto.UUID
        field :CreatedDateUTC, :string
        field :Name, :string
        field :SortOrder, :integer
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end

    def changeset(struct, data) do
        struct 
        |> cast(data, [:BrandingThemeID, :CreatedDateUTC, :Name, :SortOrder, :StatusAttributeString])
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end