defmodule EliXero.CoreApi.Models.Contacts.Contact.TrackingCategory do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}
    
    schema "trackingcategories" do
        field :TrackingCategoryName, :string
        field :TrackingOptionName, :string
    end    
end