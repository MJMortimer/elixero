defmodule EliXero.CoreApi.Models.Common.PaymentTerms do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "paymentterms" do
        embeds_one :Bills, EliXero.CoreApi.Models.Common.PaymentTerms.Terms
        embeds_one :Sales, EliXero.CoreApi.Models.Common.PaymentTerms.Terms
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end

    def changeset(struct, data) do
        struct 
        |> cast(data, [:StatusAttributeString])
        |> cast_embed(:Bills)
        |> cast_embed(:Sales)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end    
end