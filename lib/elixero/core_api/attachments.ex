defmodule EliXero.CoreApi.Attachments do
  @api_type :core
  @resource "attachments"

  def find(client, endpoint, identifier) do
    resource = endpoint <> "/" <> identifier <> "/" <> @resource

    EliXero.CoreApi.Common.find(client, resource)
  end

  def find(client, endpoint, identifier, filename) do
    resource = endpoint <> "/" <> identifier <> "/" <> @resource <> "/" <> filename

    EliXero.CoreApi.Common.find(client, resource)
  end

  def upload_attachment(client, endpoint, identifier, filename, file_path, include_online) do
    resource = endpoint <> "/" <> identifier <> "/" <> @resource

    case client.app_type do
      :private -> EliXero.Private.upload_attachment(client.access_token, resource, @api_type, file_path, filename, include_online)
      :public -> EliXero.Public.upload_attachment(client.access_token, resource, @api_type, file_path, filename, include_online)
      :partner -> EliXero.Partner.upload_attachment(client.access_token, resource, @api_type, file_path, filename, include_online)
    end
  end
end