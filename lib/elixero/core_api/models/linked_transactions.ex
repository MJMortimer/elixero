defmodule EliXero.CoreApi.Models.LinkedTransactions do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "linkedtransactions" do
        embeds_many :LinkedTransactions, EliXero.CoreApi.Models.LinkedTransactions.LinkedTransaction
    end
end