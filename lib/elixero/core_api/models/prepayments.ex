defmodule EliXero.CoreApi.Models.Prepayments do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "prepayments" do
        embeds_many :Prepayments, EliXero.CoreApi.Models.Prepayments.Prepayment
    end
end