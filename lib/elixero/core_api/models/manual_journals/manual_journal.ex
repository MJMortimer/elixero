defmodule EliXero.CoreApi.Models.ManualJournals.ManualJournal do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :ManualJournalID,
        :Date,
        :Status,
        :LineAmountTypes,
        :Url,
        :ShowOnCashBasisReports,
        :Narration,
        :HasAttachments,
        :UpdatedDateUTC,
        :StatusAttributeString
    ]

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

    def changeset(struct, data) do
        struct
        |> cast(data, @fields)
        |> cast_embed(:JournalLines)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end