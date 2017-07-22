defmodule EliXero.CoreApi.Models.Journals do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "journals" do
        embeds_many :Journals, EliXero.CoreApi.Models.Journals.Journal
    end
end