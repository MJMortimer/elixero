defmodule EliXero.CoreApi.Models.TrackingCategories do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "trackingcategories" do
        embeds_many :TrackingCategories, EliXero.CoreApi.Models.TrackingCategories.TrackingCategory
    end
end