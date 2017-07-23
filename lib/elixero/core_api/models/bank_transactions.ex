defmodule EliXero.CoreApi.Models.BankTransactions do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "banktransactions" do
        embeds_many :BankTransactions, EliXero.CoreApi.Models.BankTransactions.BankTransaction
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:BankTransactions)
        |> apply_changes
    end    

    def from_validation_exception(data) do
        remapped_data = %{:BankTransactions => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:BankTransactions)
        |> apply_changes
    end
end