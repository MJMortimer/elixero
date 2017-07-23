defmodule EliXero.CoreApi.Models.Reports.Report.Rows.Cell.Attribute do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "attributes" do
        field :Value, :string
        field :Id, :string
    end

    def changeset(struct, data) do
        struct
        |> cast(data, [:field, :Id])
    end
end