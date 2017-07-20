defmodule EliXero.CoreApi.Models.Common.Phone do
    defstruct [
        :PhoneType,
        :PhoneNumber,
        :PhoneAreaCode,
        :PhoneCountryCode,
        :ValidationErrors,
        :Warnings,
        :StatusAttributeString 
    ]
end