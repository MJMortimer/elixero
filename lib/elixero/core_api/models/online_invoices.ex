defmodule EliXero.CoreApi.Models.OnlineInvoices do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "onlineinvoices" do
        embeds_many :OnlineInvoices, EliXero.CoreApi.Models.OnlineInvoices.OnlineInvoice
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:OnlineInvoices)
        |> apply_changes
    end
end