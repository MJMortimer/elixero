defmodule EliXero.CoreApi.Models.Accounts.Account do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [    
        :AccountID,
        :Code,
        :Name,
        :Status,
        :Type,
        :BankAccountType,
        :TaxType,
        :Description,
        :Class,
        :SystemAccount,
        :EnablePaymentsToAccount,
        :ShowInExpenseClaims,
        :BankAccountNumber,
        :CurrencyCode,
        :ReportingCode,
        :ReportingCodeName,
        :HasAttachments,
        :UpdatedDateUTC,
        :StatusAttributeString
    ]

    schema "accounts" do
        field :AccountID, Ecto.UUID
        field :Code, :string
        field :Name, :string
        field :Status, :string
        field :Type, :string
        field :BankAccountType, :string
        field :TaxType, :string
        field :Description, :string
        field :Class, :string
        field :SystemAccount, :string
        field :EnablePaymentsToAccount, :boolean
        field :ShowInExpenseClaims, :boolean
        field :BankAccountNumber, :string
        field :CurrencyCode, :string
        field :ReportingCode, :string
        field :ReportingCodeName, :string
        field :HasAttachments, :boolean
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