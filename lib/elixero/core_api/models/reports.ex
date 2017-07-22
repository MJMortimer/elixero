defmodule EliXero.CoreApi.Models.Reports do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "reports" do
        embeds_many :Reports, EliXero.CoreApi.Models.Reports.Report
    end
end