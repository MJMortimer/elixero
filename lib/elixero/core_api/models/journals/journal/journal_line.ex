defmodule EliXero.CoreApi.Models.Journals.Journal.JournalLine do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :JournalLineID,
        :AccountID,
        :AccountCode,
        :AccountType,
        :AccountName,
        :Description,
        :NetAmount,
        :GrossAmount,
        :TaxAmount,
        :TaxType,
        :TaxName,
        :StatusAttributeString
    ]

    schema "journallines" do
        field :JournalLineID, Ecto.UUID
        field :AccountID, Ecto.UUID
        field :AccountCode, :string
        field :AccountType, :string
        field :AccountName, :string
        field :Description, :string
        field :NetAmount, :decimal
        field :GrossAmount, :decimal
        field :TaxAmount, :decimal
        field :TaxType, :string
        field :TaxName, :string
        embeds_many :TrackingCategories, EliXero.CoreApi.Models.Common.LineItems.TrackingCategory
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string        
    end

    def changeset(struct, data) do
        struct
        |> cast(data, @fields)
        |> cast_embed(:TrackingCategories)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end