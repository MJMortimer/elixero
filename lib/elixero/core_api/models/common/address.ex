defmodule EliXero.CoreApi.Models.Common.Address do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "addresses" do
        field :AddressType, :string
        field :AddressLine1, :string
        field :AddressLine2, :string
        field :AddressLine3, :string
        field :AddressLine4, :string
        field :City, :string
        field :Region, :string
        field :PostalCode, :integer
        field :Country, :string
        field :AttentionTo, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end
end