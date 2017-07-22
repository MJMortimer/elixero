defmodule EliXero.CoreApi.Models.Common.PaymentTerms do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "paymentterms" do
        embeds_one :Bills, EliXero.CoreApi.Models.Common.PaymentTerms.Terms
        embeds_one :Sales, EliXero.CoreApi.Models.Common.PaymentTerms.Terms
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end    
end