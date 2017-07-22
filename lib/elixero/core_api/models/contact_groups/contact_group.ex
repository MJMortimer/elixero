defmodule EliXero.CoreApi.Models.ContactGroups.ContactGroup do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "contactgroups" do
        field :ContactGroupID, Ecto.UUID
        field :Name, :string
        field :Status, :string
        embeds_many :Contacts, EliXero.CoreApi.Models.Contacts.Contact
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end

    def changeset(struct, data) do
        struct 
        |> cast(data, [:ContactGroupID, :Name, :Status, :StatusAttributeString])
        |> cast_embed(:Contacts)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end