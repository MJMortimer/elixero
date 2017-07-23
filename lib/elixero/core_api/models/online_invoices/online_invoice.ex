defmodule EliXero.CoreApi.Models.OnlineInvoices.OnlineInvoice do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "onlineinvoices" do
        field :OnlineInvoiceUrl, :string 
    end

    def changeset(struct, data) do
        struct
        |> cast(data, [:OnlineInvoiceUrl])
    end
end