defmodule EliXero.CoreApi.Models.Common.Phone do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "phones" do
        field :PhoneType, :string
        field :PhoneNumber, :string
        field :PhoneAreaCode, :string
        field :PhoneCountryCode, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end
end