defmodule EliXero.CoreApi.Models.ManualJournals.ManualJournal do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "manualjournals" do
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
end