defmodule EliXero.CoreApi.Models.BankTransfers do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "banktransfers" do
        embeds_many :BankTransfers, EliXero.CoreApi.Models.BankTransfers.BankTransfer
    end
end