defmodule EliXero.CoreApi.Models.ManualJournals do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "manualjournals" do
        embeds_many :ManualJournals, EliXero.CoreApi.Models.ManualJournals.ManualJournal
    end
end