defmodule EliXero.CoreApi.Models.Contacts.Contact.Balances do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "balances" do
        embeds_one :AccountsReceivable, EliXero.CoreApi.Models.Contacts.Contact.Balances.Balance
        embeds_one :AccountsPayable, EliXero.CoreApi.Models.Contacts.Contact.Balances.Balance
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end
end