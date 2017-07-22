defmodule EliXero.CoreApi.Models.Currencies.Currency do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "currencies" do
        field :Code, :string
        field :Description, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string   
    end
end