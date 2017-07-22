defmodule EliXero.CoreApi.Models.Attachments do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "attachments" do
        embeds_many :Attachments, EliXero.CoreApi.Models.Attachments.Attachment
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Attachments)
        |> apply_changes
    end
end