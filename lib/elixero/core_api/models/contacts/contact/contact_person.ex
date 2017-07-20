defmodule EliXero.CoreApi.Models.Contacts.Contact.ContactPerson do
    defstruct [
        :ContactPersonID,
        :FirstName,
        :LastName,
        :EmailAddress,
        :IncludeInEmails,
        :ValidationErrors,
        :Warnings,
        :StatusAttributeString  
    ]
end