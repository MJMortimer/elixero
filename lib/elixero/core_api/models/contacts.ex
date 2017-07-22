defmodule EliXero.CoreApi.Models.Contacts do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "contacts" do
        embeds_many :Contacts, EliXero.CoreApi.Models.Contacts.Contact
    end
end