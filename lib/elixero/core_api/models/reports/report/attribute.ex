defmodule EliXero.CoreApi.Models.Reports.Report.Attribute do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "attributes" do
        field :Name, :string
        field :Description, :string
        field :Value, :string       
    end
end