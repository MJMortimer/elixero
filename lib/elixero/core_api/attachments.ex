defmodule EliXero.CoreApi.Attachments do
  @api_type :core
  @resource "attachments"
  @model_module EliXero.CoreApi.Models.Attachments

  def find(client, endpoint, identifier) do
    resource = endpoint <> "/" <> identifier <> "/" <> @resource

    EliXero.CoreApi.Common.find(client, resource)
    |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module)
  end

  def find(client, endpoint, identifier, filename) do
    resource = endpoint <> "/" <> identifier <> "/" <> @resource <> "/" <> filename

    response = EliXero.CoreApi.Common.find(client, resource)
    %{"data" => response.body, "http_status_code" => response.status_code}
  end

  def upload_attachment(client, endpoint, identifier, filename, file_path, include_online) do
    resource = endpoint <> "/" <> identifier <> "/" <> @resource

    case client.app_type do
      :private -> EliXero.Private.upload_attachment(client.access_token, resource, @api_type, file_path, filename, include_online)
      :public -> EliXero.Public.upload_attachment(client.access_token, resource, @api_type, file_path, filename, include_online)
      :partner -> EliXero.Partner.upload_attachment(client.access_token, resource, @api_type, file_path, filename, include_online)
    end |> EliXero.CoreApi.Utils.ResponseHandler.handle_response(@model_module) 
    
  end
end