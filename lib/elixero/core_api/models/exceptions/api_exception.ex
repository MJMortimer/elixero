defmodule EliXero.CoreApi.Models.Exceptions.ApiException do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "apiexceptions" do
        field :ErrorNumber, :integer
        field :Type, :string
        field :Message, :string
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [:ErrorNumber, :Type, :Message])
        |> apply_changes
    end
end