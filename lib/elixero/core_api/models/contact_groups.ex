defmodule EliXero.CoreApi.Models.ContactGroups do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "contactgroups" do
        embeds_many :ContactGroups, EliXero.CoreApi.Models.ContactGroups.ContactGroup
    end
end