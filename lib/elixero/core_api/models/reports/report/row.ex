defmodule EliXero.CoreApi.Models.Reports.Report.Row do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "rows" do
        field :RowType, :string
        embeds_many :Cells, EliXero.CoreApi.Models.Reports.Report.Rows.Cell
        field :Title, :string
        embeds_many :Rows, EliXero.CoreApi.Models.Reports.Report.Row
    end

    def changeset(struct, data) do
        struct
        |> cast(data, [:RowType, :Title])
        |> cast_embed(:Cells)
        |> cast_embed(:Rows)
    end
end