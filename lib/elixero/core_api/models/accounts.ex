defmodule EliXero.CoreApi.Models.Accounts do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "accounts" do
        embeds_many :Accounts, EliXero.CoreApi.Models.Accounts.Account
    end
end