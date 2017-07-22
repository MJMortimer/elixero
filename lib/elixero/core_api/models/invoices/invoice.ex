defmodule EliXero.CoreApi.Models.Invoices.Invoice do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "invoices" do
        field :InvoiceID, Ecto.UUID
        field :InvoiceNumber, :string
        embeds_one :Contact, EliXero.CoreApi.Models.Contacts.Contact
        field :Type, :string
        field :Status, :string
        field :LineAmountTypes, :string
        field :Date, :string
        field :DueDate, :string
        field :ExpectedPaymentDate, :string
        field :PlannedPaymentDate, :string
        field :SubTotal, :decimal
        field :TotalTax, :decimal
        field :TotalDiscount, :decimal
        field :Total, :decimal     
        field :CurrencyCode, :string  
        field :CurrencyRate, :decimal
        field :FullyPaidOnDate, :string
        field :AmountDue, :decimal
        field :AmountPaid, :decimal
        field :AmountCredited, :decimal
        field :HasAttachments, :boolean
        field :BrandingThemeID, Ecto.UUID
        field :Url, :string
        field :Reference, :string
        embeds_many :LineItems, EliXero.CoreApi.Models.Common.LineItem
        field :SentToContact, :boolean
        embeds_many :CreditNotes, EliXero.CoreApi.Modesl.CreditNotes.CreditNote
        embeds_many :Prepayments, EliXero.CoreApi.Modesl.Prepayments.Prepayment
        embeds_many :Overpayments, EliXero.CoreApi.Modesl.Overpayments.Overpayment
        embeds_many :Payments, EliXero.CoreApi.Modesl.Payments.Payment
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string 
    end
end