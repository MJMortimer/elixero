defmodule EliXero.CoreApi.Models.RepeatingInvoices do
    use Ecto.Schema    
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "repeatinginvoices" do
        embeds_many :RepeatingInvoices, EliXero.CoreApi.Models.RepeatingInvoices.RepeatingInvoice
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:RepeatingInvoices)
        |> apply_changes
    end
end