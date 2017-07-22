defmodule EliXero.CoreApi.Models.Items do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "items" do
        embeds_many :Items, EliXero.CoreApi.Models.Items.Item
    end
end