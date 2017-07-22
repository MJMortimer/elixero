defmodule EliXero.CoreApi.Models.TaxRates do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "taxrates" do
        embeds_many :TaxRates, EliXero.CoreApi.Models.TaxRates.TaxRate
    end
end