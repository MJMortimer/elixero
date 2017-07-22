defmodule EliXero.CoreApi.Models.Common.ExternalLink do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "externallinks" do
        field :LinkType, :string
        field :Url, :string
        field :Description, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string   
    end
end