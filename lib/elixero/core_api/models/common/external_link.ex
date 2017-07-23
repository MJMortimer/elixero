defmodule EliXero.CoreApi.Models.Common.ExternalLink do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "externallinks" do
        field :LinkType, :string
        field :Url, :string
        field :Description, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string   
    end

    def changeset(struct, data) do
        struct
        |> cast(data, [:LinkType, :Url, :Description, :StatusAttributeString])
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end