defmodule EliXero.CoreApi.Models.ContactGroups do
    use Ecto.Schema
    import Ecto.Changeset
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "contactgroups" do
        embeds_many :ContactGroups, EliXero.CoreApi.Models.ContactGroups.ContactGroup
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:ContactGroups)
        |> apply_changes
    end
end