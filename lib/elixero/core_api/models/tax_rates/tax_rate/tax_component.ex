defmodule EliXero.CoreApi.Models.TaxRates.TaxRate.TaxComponent do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "taxcomponents" do
        field :Name, :string
        field :Rate, :string
        field :IsCompound, :boolean
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end
end