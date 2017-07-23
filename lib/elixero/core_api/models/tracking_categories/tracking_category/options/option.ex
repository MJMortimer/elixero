defmodule EliXero.CoreApi.Models.TrackingCategories.TrackingCategory.Options.Option do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "options" do
        field :TrackingOptionID, Ecto.UUID
        field :Name, :string
        field :Status, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end

    def changeset(struct, data) do
        struct
        |> cast(data, [:TrackingOptionID, :Name, :Status, :StatusAttributeString])
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end