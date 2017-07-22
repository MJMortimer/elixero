defmodule EliXero.CoreApi.Models.Reports.Report.Rows.Cell.Attribute do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "attributes" do
        field :Value, :string
        field :Id, :string
    end
end