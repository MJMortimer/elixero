defmodule EliXero.CoreApi.Models.CreditNotes.CreditNote do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "creditnotes" do
        field :CreditNoteID, Ecto.UUID
        field :CreditNoteNumber, :string
        field :Type, :string
        field :Reference, :string
        field :SentToContact, :boolean
        field :AppliedAmount, :decimal
        field :RemainingCredit, :decimal
        field :CurrencyRate, :decimal
        embeds_one :Contact, EliXero.CoreApi.Models.Contacts.Contact
        field :Date, :string
        field :DueDate, :string
        field :BrandingThemeID, Ecto.UUID
        field :Status, :string
        field :LineAmountTypes, :string
        field :SubTotal, :decimal
        field :TotalTax, :decimal
        field :Total, :decimal
        field :CurrencyCode, :string
        field :HasAttachments, :boolean
        field :FullyPaidOnDate, :string
        embeds_many :LineItems, EliXero.CoreApi.Models.Common.LineItem
        embeds_many :Allocations, EliXero.CoreApi.Models.CreditNotes.CreditNote.Allocation
        embeds_many :Payments, EliXero.CoreApi.Models.Payments.Payment
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end
end