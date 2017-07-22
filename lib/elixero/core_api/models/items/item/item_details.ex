defmodule EliXero.CoreApi.Models.Items.Item.ItemDetails do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "itemdetails" do
        field :UnitPrice, :decimal
        field :AccountCode, :string
        field :TaxType, :string
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string   
    end
end