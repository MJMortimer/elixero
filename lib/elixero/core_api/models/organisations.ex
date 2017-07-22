defmodule EliXero.CoreApi.Models.Organisations do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "organisations" do
        embeds_many :Organisations, EliXero.CoreApi.Models.Organisations.Organisation
    end
end