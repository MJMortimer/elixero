defmodule EliXero.CoreApi.Models.ContactGroups.ContactGroup do
    use Ecto.Schema
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
end