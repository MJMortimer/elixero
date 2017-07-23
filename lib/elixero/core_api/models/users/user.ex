defmodule EliXero.CoreApi.Models.Users.User do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :UserID,
        :EmailAddress,
        :FirstName,
        :LastName,
        :IsSubscriber,
        :OrganisationRole,
        :UpdatedDateUTC,
        :StatusAttributeString
    ]

    schema "users" do
        field :UserID, Ecto.UUID
        field :EmailAddress, :string
        field :FirstName, :string
        field :LastName, :string
        field :IsSubscriber, :boolean
        field :OrganisationRole, :string
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string   
    end

    def changeset(struct, data) do
        struct
        |> cast(data, @fields)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end