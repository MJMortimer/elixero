defmodule EliXero.CoreApi.Models.ExpenseClaims.ExpenseClaim do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :ExpenseClaimID,
        :Status,
        :Total,
        :AmountDue,
        :AmountPaid,
        :PaymentDueDate,
        :ReportingDate,
        :UpdatedDateUTC,
        :StatusAttributeString
    ]

    schema "ExpenseClaims" do
        field :ExpenseClaimID, Ecto.UUID
        field :Status, :string
        field :Total, :decimal
        field :AmountDue, :decimal
        field :AmountPaid, :decimal
        field :PaymentDueDate, :string
        field :ReportingDate, :string
        embeds_one :User, EliXero.CoreApi.Models.Users.User
        embeds_many :Receipts, EliXero.CoreApi.Models.Receipts.Receipt
        embeds_many :Payments, EliXero.CoreApi.Models.Payments.Payment
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string   
    end

    def changeset(struct, data) do
        struct
        |> cast(data, @fields)
        |> cast_embed(:User)
        |> cast_embed(:Receipts)
        |> cast_embed(:Payments)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end