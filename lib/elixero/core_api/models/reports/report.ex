defmodule EliXero.CoreApi.Models.Reports.Report do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "reports" do
        field :ReportID, Ecto.UUID
        field :ReportName, :string
        field :ReportType, :string
        field :ReportTitles, {:array, :string}
        field :ReportDate, :string
        field :UpdatedDateUTC, :string
        embeds_many :Attributes, EliXero.CoreApi.Models.Reports.Report.Attribute
        embeds_many :Fields, EliXero.CoreApi.Models.Reports.Report.Field
        embeds_many :Rows, EliXero.CoreApi.Models.Reports.Report.Row
    end

    def changeset(struct, data) do
        struct
        |> cast(data, [:ReportID, :ReportName, :ReportType, :ReportTitles, :ReportDate, :UpdatedDateUTC])
        |> cast_embed(:Attributes)
        |> cast_embed(:Fields)
        |> cast_embed(:Rows)
    end
end