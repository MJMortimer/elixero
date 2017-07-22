defmodule EliXero.CoreApi.Models.TaxRates.TaxRate.TaxComponent do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "taxcomponents" do
        field :Name, :string
        field :Rate, :string
        field :IsCompound, :boolean        
    end
end