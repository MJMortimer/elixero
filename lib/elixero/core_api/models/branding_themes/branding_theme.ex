defmodule EliXero.CoreApi.Models.BrandingThemes.BrandingTheme do
    use Ecto.Schema
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
end