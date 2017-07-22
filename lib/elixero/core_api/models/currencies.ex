defmodule EliXero.CoreApi.Models.Currencies do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "currencies" do
        embeds_many :Currencies, EliXero.CoreApi.Models.Currencies.Currency
    end
end