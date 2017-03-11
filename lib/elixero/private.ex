defmodule EliXero.Private do
  #cert details
  @private_key Application.get_env(:elixero, :private_key_path)

  #consumer details
  @oauth_consumer_key Application.get_env(:elixero, :consumer_key)

  @user_agent "EliXero - " <> @oauth_consumer_key

  def find(resource, api_type) do
    url = EliXero.Utils.Urls.api(resource, api_type)

    header = EliXero.Utils.Oauth.create_auth_header("GET", url, [oauth_token: @oauth_consumer_key], nil)
    EliXero.Utils.Http.get(url, header)
  end

  def create(resource, api_type, data_map) do
    url = EliXero.Utils.Urls.api(resource, api_type)

    method =
      case(api_type) do
        :core -> "PUT"
      end

    header = EliXero.Utils.Oauth.create_auth_header(method, url, [oauth_token: @oauth_consumer_key], nil)

    case(method) do
      "PUT" -> EliXero.Utils.Http.put(url, header, data_map)
    end
  end

  def update(resource, api_type, data_map) do
    url = EliXero.Utils.Urls.api(resource, api_type)

    method =
      case(api_type) do
        :core -> "POST"
      end

    header = EliXero.Utils.Oauth.create_auth_header(method, url, [oauth_token: @oauth_consumer_key], nil)

    case(method) do
      "POST" -> EliXero.Utils.Http.post(url, header, data_map)
    end
  end

  def delete(resource, api_type) do
    url = EliXero.Utils.Urls.api(resource, api_type)

    header = EliXero.Utils.Oauth.create_auth_header("DELETE", url, [oauth_token: @oauth_consumer_key], nil)

    EliXero.Utils.Http.delete(url, header)
  end

  def upload_multipart(resource, api_type, path_to_file, name) do
    url = EliXero.Utils.Urls.api(resource, api_type)

    header = EliXero.Utils.Oauth.create_auth_header("POST", url, [oauth_token: @oauth_consumer_key], [Name: name])

    EliXero.Utils.Http.upload_multipart(url, header, path_to_file, [{"Name", name}])
  end

  def upload_attachment(resource, api_type, path_to_file, filename, include_online) do
    url = EliXero.Utils.Urls.api(resource, api_type)
    url_for_signing = url <> "/" <> String.replace(filename, " ", "%20") <> "?includeonline=" <> ( if include_online, do: "true", else: "false") # spaces are dumb!
    header = EliXero.Utils.Oauth.create_auth_header("POST", url_for_signing, [oauth_token: @oauth_consumer_key], nil)

    url = url <> "/" <> URI.encode(filename, &URI.char_unreserved?(&1)) <> "?includeonline=" <> ( if include_online, do: "true", else: "false")
    EliXero.Utils.Http.upload_attachment(url, header, path_to_file)
  end
end