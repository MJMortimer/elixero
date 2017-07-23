defmodule EliXero.CoreApi.Models.Reports.Report.Field do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "fields" do
        field :FieldID, :string
        field :Description, :string
        field :Value, :string
        field :Format, :string
    end

    def changeset(struct, data) do
        struct
        |> cast(data, [:FieldID, :Description, :Value, :Format])
    end
end