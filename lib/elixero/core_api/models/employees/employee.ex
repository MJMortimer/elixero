defmodule EliXero.CoreApi.Models.Employees.Employee do
    use Ecto.Schema
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
end