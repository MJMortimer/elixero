defmodule EliXero.CoreApi.Models.Contacts.Contact.Balances.Balance do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "balances" do
        field :Outstanding, :decimal
        field :Overdue, :decimal
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end
end