defmodule EliXero.CoreApi.Models.TaxRates do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "taxrates" do
        embeds_many :TaxRates, EliXero.CoreApi.Models.TaxRates.TaxRate
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:TaxRates)
        |> apply_changes
    end
end