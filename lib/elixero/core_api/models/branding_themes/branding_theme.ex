defmodule EliXero.CoreApi.Models.BrandingThemes.BrandingTheme do
    defstruct [
        :BrandingThemeID,
        :CreatedDateUTC,
        :Name,
        :SortOrder,
        :ValidationErrors,
        :Warnings,
        :StatusAttributeString  
    ]
end