defmodule EliXero.CoreApi.Models.Accounts.Account do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "accounts" do
        field :AccountID, Ecto.UUID
        field :Code, :string
        field :Name, :string
        field :Status, :string
        field :Type, :string
        field :BankAccountType, :string
        field :TaxType, :string
        field :Description, :string
        field :Class, :string,
        field :SystemAccount, :string
        field :EnablePaymentsToAccount, :boolean
        field :ShowInExpenseClaims, :boolean
        field :BankAccountNumber, :string
        field :CurrencyCode, :string
        field :ReportingCode, :string
        field :ReportingCodeName, :string
        field :HasAttachments, :boolean
        field :UpdatedDateUTC :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string        
    end
end