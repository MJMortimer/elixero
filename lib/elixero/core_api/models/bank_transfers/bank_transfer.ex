defmodule EliXero.CoreApi.Models.BankTransfers.BankTransfer do
    use Ecto.Schema
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "banktransfers" do
        field :BankTransferID, Ecto.UUID
        embeds_one :FromBankAccount, EliXero.CoreApi.Models.Accounts.Account
        embeds_one :ToBankAccount, EliXero.CoreApi.Models.Accounts.Account
        field :FromBankTransactionID, Ecto.UUID
        field :ToBankTransactionID, Ecto.UUID
        field :CurrencyRate, :decimal
        field :Amount, :decimal
        field :Date, :string
        field :HasAttachments, :boolean
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, EliXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, EliXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string  
    end
end