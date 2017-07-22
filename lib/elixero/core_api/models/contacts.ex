defmodule EliXero.CoreApi.Models.Contacts do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "contacts" do
        embeds_many :Contacts, EliXero.CoreApi.Models.Contacts.Contact
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Contacts)
        |> apply_changes
    end
end