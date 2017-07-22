defmodule EliXero.CoreApi.Models.RepeatingInvoices.RepeatingInvoice.Schedule do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

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
end