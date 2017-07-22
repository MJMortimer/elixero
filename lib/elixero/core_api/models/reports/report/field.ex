defmodule EliXero.CoreApi.Models.Reports.Report.Field do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "fields" do
        field :FieldID, :string
        field :Description, :string
        field :Value, :string
        field :Format, :string
    end
end