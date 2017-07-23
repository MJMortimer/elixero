defmodule EliXero.CoreApi.Models.Users do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "users" do
        embeds_many :Users, EliXero.CoreApi.Models.Users.User
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Users)
        |> apply_changes
    end
end