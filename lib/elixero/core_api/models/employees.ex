defmodule EliXero.CoreApi.Models.Employees do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "employees" do
        embeds_many :Employees, EliXero.CoreApi.Models.Employees.Employee
    end
end