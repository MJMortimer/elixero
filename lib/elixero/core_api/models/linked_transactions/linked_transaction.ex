defmodule EliXero.CoreApi.Models.LinkedTransactions.LinkedTransaction do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "linkedtransactions" do
        field :LinkedTransactionID, Ecto.UUID
        field :SourceTransactionID, Ecto.UUID
        field :SourceLineItemID, Ecto.UUID
        field :ContactID, Ecto.UUID
        field :TargetTransactionID, Ecto.UUID
        field :TargetLineItemID, Ecto.UUID
        field :Status, :string
        field :Type, :string
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string        
    end
end