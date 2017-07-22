defmodule EliXero.CoreApi.Models.Reports.Report do
    use Ecto.Schema
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
end