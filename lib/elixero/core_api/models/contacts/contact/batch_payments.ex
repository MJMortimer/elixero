defmodule EliXero.CoreApi.Models.Contacts.Contact.BatchPayments do
    defstruct [
        :BankAccountNumber,
        :BankAccountName,
        :Details,
        :Code,
        :Reference,        
        :ValidationErrors,
        :Warnings,
        :StatusAttributeString  
    ]
end