defmodule EliXero.CoreApi.Models.RepeatingInvoices.RepeatingInvoice.Schedule do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :Period,
        :Unit,
        :DueDate,
        :DueDateType,
        :StartDate,
        :NextScheduledDate,
        :EndDate,
        :StatusAttributeString
    ]

    schema "schedules" do
        field :Period, :integer
        field :Unit, :string
        field :DueDate, :integer
        field :DueDateType, :string
        field :StartDate, :string
        field :NextScheduledDate, :string
        field :EndDate, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end

    def changeset(struct, data) do
        struct
        |> cast(data, @fields)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end