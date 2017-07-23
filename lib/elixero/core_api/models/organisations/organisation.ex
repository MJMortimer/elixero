defmodule EliXero.CoreApi.Models.Organisations.Organisation do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :OrganisationID,
        :Name,
        :LegalName,
        :ShortCode,
        :PaysTax,
        :Version,
        :OrganisationEntityType,
        :IsDemoCompany,
        :BaseCurrency,
        :ApiKey,
        :CountryCode,
        :OrganisationStatus,
        :TaxNumber,
        :FinancialYearEndDay,
        :FinancialYearEndMonth,
        :PeriodLockDate,
        :EndOfYearLockDate,
        :CreatedDateUTC,
        :Timezone,
        :LineOfBusiness,
        :RegistrationNumber,
        :SalesTaxBasisType,
        :SalesTaxPeriod
    ]

    schema "organisations" do
        field :OrganisationID, Ecto.UUID
        field :Name, :string
        field :LegalName, :string
        field :ShortCode, :string
        field :PaysTax, :boolean
        field :Version, :string
        field :OrganisationEntityType, :string
        field :IsDemoCompany, :boolean
        field :BaseCurrency, :string
        field :ApiKey, :string
        field :CountryCode, :string
        field :OrganisationStatus, :string
        field :TaxNumber, :string
        field :FinancialYearEndDay, :integer
        field :FinancialYearEndMonth, :integer
        field :PeriodLockDate, :string
        field :EndOfYearLockDate, :string
        field :CreatedDateUTC, :string
        field :Timezone, :string
        field :LineOfBusiness, :string
        field :RegistrationNumber, :string
        embeds_one :PaymentTerms, EliXero.CoreApi.Models.Common.PaymentTerms
        field :SalesTaxBasisType, :string
        field :SalesTaxPeriod, :string
        embeds_many :Addresses, EliXero.CoreApi.Models.Common.Address
        embeds_many :Phones, EliXero.CoreApi.Models.Common.Phone
        embeds_many :ExternalLinks, EliXero.CoreApi.Models.Common.ExternalLink
    end

    def changeset(struct, data) do
        struct
        |> cast(data, @fields)
        |> cast_embed(:PaymentTerms)
        |> cast_embed(:Addresses)
        |> cast_embed(:Phones)
        |> cast_embed(:ExternalLinks)
    end
end