defmodule EliXero.CoreApi.Models.Reports.Report.Rows.Cell do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "cells" do
        field :Value, :string
        embeds_many :Attributes, EliXero.CoreApi.Models.Reports.Report.Rows.Cell.Attribute
    end
end