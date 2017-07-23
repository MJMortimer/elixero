defmodule EliXero.CoreApi.Models.Journals do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "journals" do
        embeds_many :Journals, EliXero.CoreApi.Models.Journals.Journal
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Journals)
        |> apply_changes
    end
end