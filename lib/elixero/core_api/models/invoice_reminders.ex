defmodule EliXero.CoreApi.Models.InvoiceReminders do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "invoiceReminders" do
        embeds_many :InvoiceReminders, EliXero.CoreApi.Models.InvoiceReminders.InvoiceReminder
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:InvoiceReminders)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:InvoiceReminders => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:InvoiceReminders)
        |> apply_changes
    end
end