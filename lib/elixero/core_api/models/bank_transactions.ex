defmodule EliXero.CoreApi.Models.BankTransactions do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "banktransactions" do
        embeds_many :BankTransactions, EliXero.CoreApi.Models.BankTransactions.BankTransaction
    end
end