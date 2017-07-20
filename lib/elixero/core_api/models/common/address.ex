defmodule EliXero.CoreApi.Models.Common.Address do
    defstruct [
        :AddressType,
        :AddressLine1,
        :AddressLine2,
        :AddressLine3,
        :AddressLine4,
        :City,
        :Region,
        :PostalCode,
        :Country,
        :AttentionTo,
        :ValidationErrors,
        :Warnings,
        :StatusAttributeString 
    ]
end