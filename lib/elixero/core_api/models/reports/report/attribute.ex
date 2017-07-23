defmodule EliXero.CoreApi.Models.Reports.Report.Attribute do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "attributes" do
        field :Name, :string
        field :Description, :string
        field :Value, :string       
    end

    def changeset(struct, data) do
        struct
        |> cast(data, [:Name, :Description, :Value])
    end
end