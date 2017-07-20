defmodule EliXero.CoreApi.Models.Contacts.Contact.Balances.Balance do
    defstruct [
        :Outstanding,
        :Overdue,
        :ValidationErrors,
        :Warnings,
        :StatusAttributeString  
    ]
end