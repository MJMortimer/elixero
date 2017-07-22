defmodule EliXero.CoreApi.Models.Contacts.Contact.Balances do
    use Ecto.Schema    
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "balances" do
        embeds_one :AccountsReceivable, EliXero.CoreApi.Models.Contacts.Contact.Balances.Balance
        embeds_one :AccountsPayable, EliXero.CoreApi.Models.Contacts.Contact.Balances.Balance
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end

    def changeset(struct, data) do
        struct 
        |> cast(data, [:StatusAttributeString])
        |> cast_embed(:AccountsReceivable)
        |> cast_embed(:AccountsPayable)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end