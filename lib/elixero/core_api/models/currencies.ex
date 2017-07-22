defmodule EliXero.CoreApi.Models.Currencies do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "currencies" do
        embeds_many :Currencies, EliXero.CoreApi.Models.Currencies.Currency
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Currencies)
        |> apply_changes
    end
end