defmodule EliXero.CoreApi.Models.Contacts.Contact.BatchPayments do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "batchpayments" do
        field :BankAccountNumber, :string
        field :BankAccountName, :string
        field :Details, :string
        field :Code, :string
        field :Reference, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end
end