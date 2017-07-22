defmodule EliXero.CoreApi.Models.Payments do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "payments" do
        embeds_many :Payments, EliXero.CoreApi.Models.Payments.Payment
    end
end