defmodule EliXero.CoreApi.Models.CreditNotes do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "creditnotes" do
        embeds_many :CreditNotes, EliXero.CoreApi.Models.CreditNotes.CreditNote
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:CreditNotes)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:CreditNotes => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:CreditNotes)
        |> apply_changes
    end
end