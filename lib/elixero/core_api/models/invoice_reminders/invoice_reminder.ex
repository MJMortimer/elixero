defmodule EliXero.CoreApi.Models.InvoiceReminders.InvoiceReminder do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "invoiceReminders" do
        field :Enabled, :boolean
    end

    def changeset(struct, data) do
        struct
        |> cast(data, [:Enabled])
    end
end