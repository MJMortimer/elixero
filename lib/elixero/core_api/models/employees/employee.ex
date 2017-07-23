defmodule EliXero.CoreApi.Models.Employees.Employee do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "employees" do
        field :EmployeeID, Ecto.UUID
        field :Status, :string
        field :FirstName, :string
        field :LastName, :string
        embeds_one :ExternalLink, EliXero.CoreApi.Models.Common.ExternalLink
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string   
    end

    def changeset(struct, data) do
        struct
        |> cast(data, [:EmployeeID, :Status, :FirstName, :LastName, :StatusAttributeString])
        |> cast_embed(:ExternalLink)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end