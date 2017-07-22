defmodule EliXero.CoreApi.Models.Employees do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "employees" do
        embeds_many :Employees, EliXero.CoreApi.Models.Employees.Employee
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Employees)
        |> apply_changes
    end
end