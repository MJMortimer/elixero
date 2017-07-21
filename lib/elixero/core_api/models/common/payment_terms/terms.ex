defmodule EliXero.CoreApi.Models.Common.PaymentTerms.Terms do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__]}

    schema "terms" do
        field :Day, :integer
        field :Type, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end    
end