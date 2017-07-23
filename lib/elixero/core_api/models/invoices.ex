defmodule EliXero.CoreApi.Models.Invoices do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "invoices" do
        embeds_many :Invoices, EliXero.CoreApi.Models.Invoices.Invoice
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Invoices)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:Invoices => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:Invoices)
        |> apply_changes
    end
end