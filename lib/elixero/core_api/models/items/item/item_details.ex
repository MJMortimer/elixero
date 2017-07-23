defmodule EliXero.CoreApi.Models.Items.Item.ItemDetails do
    use Ecto.Schema
    import Ecto.Changeset

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

    def changeset(struct, data) do
        struct
        |> cast(data, [:UnitPrice, :AccountCode, :TaxType, :UpdatedDateUTC, :StatusAttributeString])
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end