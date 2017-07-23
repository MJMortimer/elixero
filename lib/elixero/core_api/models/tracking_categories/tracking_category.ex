defmodule EliXero.CoreApi.Models.TrackingCategories.TrackingCategory do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "trackingcategories" do
        field :TrackingCategoryID, Ecto.UUID
        field :Name, :string
        field :Status, :string
        embeds_many :Options, EliXero.CoreApi.Models.TrackingCategories.TrackingCategory.Options.Option
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string        
    end

    def changeset(struct, data) do
        struct
        |> cast(data, [:TrackingCategoryID, :Name, :Status, :StatusAttributeString])
        |> cast_embed(:Options)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end