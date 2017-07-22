defmodule EliXero.CoreApi.Models.Common.Warning do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "errors" do
        field :Message, :string
    end

    def changeset(struct, data) do
        struct 
        |> cast(data, [:Message])
    end
end