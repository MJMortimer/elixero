defmodule EliXero.CoreApi.Models.Payments do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "payments" do
        embeds_many :Payments, EliXero.CoreApi.Models.Payments.Payment
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Payments)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:Payments => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:Payments)
        |> apply_changes
    end
end