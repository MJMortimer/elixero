defmodule EliXero.CoreApi.Models.Contacts.Contact.Balances.Balance do
    use Ecto.Schema    
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "balances" do
        field :Outstanding, :decimal
        field :Overdue, :decimal
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end

    def changeset(struct, data) do
        struct 
        |> cast(data, [:Outstanding, :Overdue, :StatusAttributeString])
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end