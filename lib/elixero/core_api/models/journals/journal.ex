defmodule EliXero.CoreApi.Models.Journals.Journal do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :JournalID,
        :JournalDate,
        :JournalNumber,
        :CreatedDateUtc,
        :Reference,
        :SourceId,
        :SourceType,
        :StatusAttributeString 
    ]

    schema "journals" do
        field :JournalID, Ecto.UUID
        field :JournalDate, :string
        field :JournalNumber, :integer
        field :CreatedDateUtc, :string
        field :Reference, :string
        embeds_many :JournalLines, EliXero.CoreApi.Models.Journals.Journal.JournalLine
        field :SourceId, :string
        field :SourceType, :string
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