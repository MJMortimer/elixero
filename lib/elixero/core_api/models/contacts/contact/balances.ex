defmodule EliXero.CoreApi.Models.Contacts.Contact.Balances do
    defstruct [
        :AccountsReceivable,
        :AccountsPayable,
        :ValidationErrors,
        :Warnings,
        :StatusAttributeString  
    ]
end