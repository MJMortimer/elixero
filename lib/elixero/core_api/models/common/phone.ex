defmodule EliXero.CoreApi.Models.Common.Phone do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "phones" do
        field :PhoneType, :string
        field :PhoneNumber, :string
        field :PhoneAreaCode, :string
        field :PhoneCountryCode, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end

    def changeset(struct, data) do
        struct 
        |> cast(data, [:PhoneType, :PhoneNumber, :PhoneAreaCode, :PhoneCountryCode, :StatusAttributeString])
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end