defmodule EliXero.CoreApi.Models.ExpenseClaims do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "expenseclaims" do
        embeds_many :ExpenseClaims, EliXero.CoreApi.Models.ExpenseClaims.ExpenseClaim
    end
end