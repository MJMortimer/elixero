defmodule EliXero.CoreApi.Models.ManualJournals.ManualJournal.JournalLine do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "journallines" do
        field :Description, :string
        field :LineAmount, :decimal
        field :AccountCode, :string
        field :TaxType, :string
        field :TaxAmount, :string        
        embeds_many :Tracking, EliXero.CoreApi.Models.Common.LineItems.TrackingCategory
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string        
    end

    def changeset(struct, data) do
        struct
        |> cast(data, [:Description, :LineAmount, :AccountCode, :TaxType, :TaxAmount, :StatusAttributeString])
        |> cast_embed(:Tracking)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end