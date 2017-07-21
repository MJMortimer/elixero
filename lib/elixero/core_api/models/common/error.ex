defmodule EliXero.CoreApi.Models.Common.Error do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "errors" do
        field :Message, :string
    end
end