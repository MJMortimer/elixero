defmodule EliXero.CoreApi.Models.Accounts do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "accounts" do
        embeds_many :Accounts, EliXero.CoreApi.Models.Accounts.Account
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Accounts)
        |> apply_changes
    end
end