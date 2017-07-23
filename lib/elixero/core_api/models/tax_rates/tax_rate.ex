defmodule EliXero.CoreApi.Models.TaxRates.TaxRate do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :Name,
        :TaxType,
        :ReportTaxType,
        :Status,
        :CanApplyToAssets,
        :CanApplyToEquity,
        :CanApplyToExpenses,
        :CanApplyToLiabilities,
        :CanApplyToRevenue,
        :DisplayTaxRate,
        :EffectiveRate,
        :StatusAttributeString
    ]

    schema "taxrates" do
        field :Name, :string
        field :TaxType, :string
        embeds_many :TaxComponents, EliXero.CoreApi.Models.TaxRates.TaxRate.TaxComponent
        field :ReportTaxType, :string
        field :Status, :string
        field :CanApplyToAssets, :boolean
        field :CanApplyToEquity, :boolean
        field :CanApplyToExpenses, :boolean
        field :CanApplyToLiabilities, :boolean
        field :CanApplyToRevenue, :boolean
        field :DisplayTaxRate, :decimal
        field :EffectiveRate, :decimal        
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end

    def changeset(struct, data) do
        struct
        |> cast(data, @fields)
        |> cast_embed(:TaxComponents)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end