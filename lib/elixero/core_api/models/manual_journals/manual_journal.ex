defmodule EliXero.CoreApi.Models.ManualJournals.ManualJournal do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "manualjournals" do
        field :ManualJournalID, Ecto.UUID
        field :Date, :string
        field :Status, :string
        field :LineAmountTypes, :string
        field :Url, :string
        field :ShowOnCashBasisReports, :boolean
        field :Narration, :string
        field :HasAttachments, :boolean
        embeds_many :JournalLines, EliXero.CoreApi.Models.ManualJournals.ManualJournal.JournalLine
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string        
    end
end