defmodule EliXero.CoreApi.Models.Attachments do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "attachments" do
        embeds_many :Attachments, EliXero.CoreApi.Models.Attachments.Attachment
    end
end