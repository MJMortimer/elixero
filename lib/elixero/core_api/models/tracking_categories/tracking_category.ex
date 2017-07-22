defmodule EliXero.CoreApi.Models.TrackingCategories.TrackingCategory do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "trackingcategories" do
        field :TrackingCategoryID, Ecto.UUID
        field :Name, :string
        field :Status, :string
        embeds_many :Options, EliXero.CoreApi.Models.TrackingCategories.TrackingCategory.Option
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string        
    end
end