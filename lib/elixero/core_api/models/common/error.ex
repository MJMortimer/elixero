defmodule EliXero.CoreApi.Models.Common.Error do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "errors" do
        field :Message, :string
    end
end