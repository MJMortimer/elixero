defmodule EliXero.CoreApi.Models.Overpayments do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "overpayments" do
        embeds_many :Overpayments, EliXero.CoreApi.Models.Overpayments.Overpayment
    end
end