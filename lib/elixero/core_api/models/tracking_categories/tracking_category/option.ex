defmodule EliXero.CoreApi.Models.TrackingCategories.TrackingCategory.Option do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "options" do
        field :TrackingOptionID, Ecto.UUID
        field :Name, :string
        field :Status, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end
end