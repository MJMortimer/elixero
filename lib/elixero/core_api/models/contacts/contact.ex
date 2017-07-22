defmodule EliXero.CoreApi.Models.Contacts.Contact do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "contacts" do
        field :ContactID, Ecto.UUID
        field :ContactStatus, :string
        field :Name, :string
        field :ContactNumber, :string
        field :FirstName, :string
        field :LastName, :string
        field :EmailAddress, :string
        field :SkypeUserName, :string
        field :BankAccountDetails, :string
        field :TaxNumber, :string
        field :AccountsReceivableTaxType, :string
        field :AccountsPayableTaxType, :string
        field :IsSupplier, :boolean
        field :IsCustomer, :boolean
        field :DefaultCurrency, :string
        field :Website, :string
        field :Discount, :decimal
        field :XeroNetworkKey, :string
        field :HasAttachments, :boolean
        field :PurchasesDefaultAccountCode, :string
        field :SalesDefaultAccountCode, :string
        embeds_many :SalesTrackingCategories, EliXero.CoreApi.Models.Contacts.TrackingCategory
        embeds_many :PurchasesTrackingCategories, EliXero.CoreApi.Models.Contacts.TrackingCatgeory
        embeds_one :BrandingTheme, EliXero.CoreApi.Models.BrandingThemes.BrandingTheme
        embeds_one :BatchPayments, EliXero.CoreApi.Models.Contacts.BatchPayments
        embeds_one :Balances, EliXero.CoreApi.Models.Contacts.Contact.Balances
        embeds_one :PaymentTerms, EliXero.CoreApi.Models.Common.PaymentTerms
        embeds_many :ContactPersons, EliXero.CoreApi.Models.Contacts.ContactPerson
        embeds_many :Addresses, EliXero.CoreApi.Models.Common.Address
        embeds_many :Phones, EliXero.CoreApi.Models.Common.Phone
        embeds_one :ContactGroups, EliXero.CoreApi.Models.ContactGroups
        field :AccountNumber, :string
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end
end