defmodule EliXero.CoreApi.Models.Contacts do
    defstruct [:Contacts]

    def from_json_string(json) do
        Poison.decode(json, as:
            %EliXero.CoreApi.Models.Contacts{
                Contacts: [
                    %EliXero.CoreApi.Models.Contacts.Contact{
                        SalesTrackingCategories: [
                            %EliXero.CoreApi.Models.Contacts.Contact.TrackingCategory{}
                        ],
                        PurchasesTrackingCategories: [
                            %EliXero.CoreApi.Models.Contacts.Contact.TrackingCategory{}
                        ],
                        BrandingTheme: %EliXero.CoreApi.Models.BrandingThemes.BrandingTheme{
                            ValidationErrors: [
                                %EliXero.CoreApi.Models.Common.Error{}
                            ],
                            Warnings: [
                                %EliXero.CoreApi.Models.Common.Warning{}
                            ]
                        },
                        BatchPayments: %EliXero.CoreApi.Models.Contacts.Contact.BatchPayments{
                            ValidationErrors: [
                                %EliXero.CoreApi.Models.Common.Error{}
                            ],
                            Warnings: [
                                %EliXero.CoreApi.Models.Common.Warning{}
                            ]
                        },
                        Balances: %EliXero.CoreApi.Models.Contacts.Contact.Balances{
                            AccountsReceivable: %EliXero.CoreApi.Models.Contacts.Contact.Balances.Balance{},
                            AccountsPayable: %EliXero.CoreApi.Models.Contacts.Contact.Balances.Balance{},
                            ValidationErrors: [
                                %EliXero.CoreApi.Models.Common.Error{}
                            ],
                            Warnings: [
                                %EliXero.CoreApi.Models.Common.Warning{}
                            ]
                        },
                        PaymentTerms: %EliXero.CoreApi.Models.Common.PaymentTerms{
                            Bills: %EliXero.CoreApi.Models.Common.PaymentTerms.Terms{
                                ValidationErrors: [
                                    %EliXero.CoreApi.Models.Common.Error{}
                                ],
                                Warnings: [
                                    %EliXero.CoreApi.Models.Common.Warning{}
                                ]
                            },
                            Sales: %EliXero.CoreApi.Models.Common.PaymentTerms.Terms{
                                ValidationErrors: [
                                    %EliXero.CoreApi.Models.Common.Error{}
                                ],
                                Warnings: [
                                    %EliXero.CoreApi.Models.Common.Warning{}
                                ]
                            },
                            ValidationErrors: [
                                %EliXero.CoreApi.Models.Common.Error{}
                            ],
                            Warnings: [
                                %EliXero.CoreApi.Models.Common.Warning{}
                            ]
                        },
                        ContactPersons: [
                            %EliXero.CoreApi.Models.Contacts.Contact.ContactPerson{
                                ValidationErrors: [
                                    %EliXero.CoreApi.Models.Common.Error{}
                                ],
                                Warnings: [
                                    %EliXero.CoreApi.Models.Common.Warning{}
                                ]
                            },
                        ],
                        Addresses: [
                            %EliXero.CoreApi.Models.Common.Address{
                                ValidationErrors: [
                                    %EliXero.CoreApi.Models.Common.Error{}
                                ],
                                Warnings: [
                                    %EliXero.CoreApi.Models.Common.Warning{}
                                ]
                            },
                        ],
                        Phones: [
                            %EliXero.CoreApi.Models.Common.Phone{
                                ValidationErrors: [
                                    %EliXero.CoreApi.Models.Common.Error{}
                                ],
                                Warnings: [
                                    %EliXero.CoreApi.Models.Common.Warning{}
                                ]
                            },
                        ],
                        ContactGroups: [
                            %EliXero.CoreApi.Models.ContactGroups.ContactGroup{
                                ValidationErrors: [
                                    %EliXero.CoreApi.Models.Common.Error{}
                                ],
                                Warnings: [
                                    %EliXero.CoreApi.Models.Common.Warning{}
                                ]
                            },
                        ],
                        ValidationErrors: [
                            %EliXero.CoreApi.Models.Common.Error{}
                        ],
                        Warnings: [
                            %EliXero.CoreApi.Models.Common.Warning{}
                        ]
                    }
                ]
            })
    end
end