defmodule EliXero.CoreApi.Models.Users do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "users" do
        embeds_many :Users, EliXero.CoreApi.Models.Users.User
    end
end