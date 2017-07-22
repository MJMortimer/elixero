defmodule EliXero.CoreApi.Models.TaxRates.TaxRate do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

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
end