defmodule EliXero.CoreApi.Models.Attachments.Attachment do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "attachments" do
        field :AttachmentID, Ecto.UUID
        field :FileName, :string
        field :Url, :string
        field :MimeType, :string
        field :ContentLength, :integer
        field :IncludeOnline, :boolean
    end
end