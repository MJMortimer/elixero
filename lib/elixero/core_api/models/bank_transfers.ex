defmodule EliXero.CoreApi.Models.BankTransfers do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "banktransfers" do
        embeds_many :BankTransfers, EliXero.CoreApi.Models.BankTransfers.BankTransfer
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:BankTransfers)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:BankTransfers => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:BankTransfers)
        |> apply_changes
    end
end