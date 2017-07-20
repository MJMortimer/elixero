defmodule EliXero.CoreApi.Models.ContactGroups.ContactGroup do
    defstruct [
        :ContactGroupID,
        :Name,
        :Status,
        :Contacts,
        :ValidationErrors,
        :Warnings,
        :StatusAttributeString 
    ]
end