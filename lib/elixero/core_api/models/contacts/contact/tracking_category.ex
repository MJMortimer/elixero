defmodule EliXero.CoreApi.Models.Contacts.Contact.TrackingCategory do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}
    
    schema "trackingcategories" do
        field :TrackingCategoryName, :string
        field :TrackingOptionName, :string
    end

    def changeset(struct, data) do
        struct 
        |> cast(data, [:TrackingCategoryName, :TrackingOptionName])
    end
end