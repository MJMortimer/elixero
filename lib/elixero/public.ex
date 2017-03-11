defmodule EliXero.Public do
  #consumer details
  @oauth_consumer_key Application.get_env(:elixero, :consumer_key)
  @oauth_consumer_secret Application.get_env(:elixero, :consumer_secret)

  def get_request_token do
    callback_url = Application.get_env(:elixero, :callback_url)
    request_token_url = EliXero.Utils.Urls.request_token
    header = EliXero.Utils.Oauth.create_auth_header("GET", request_token_url, [oauth_callback: callback_url], nil, nil)
    EliXero.Utils.Http.get(request_token_url, header)
  end

  def generate_auth_url(request_token) do
    EliXero.Utils.Urls.authorise(request_token["oauth_token"])
  end

  def approve_access_token(request_token, verifier) do
    access_token_url = EliXero.Utils.Urls.access_token
    header = EliXero.Utils.Oauth.create_auth_header("GET", access_token_url, [oauth_token: request_token["oauth_token"], oauth_verifier: verifier], nil, request_token)
    EliXero.Utils.Http.get(access_token_url, header)
  end

  def find(access_token, resource, api_type) do
    url = EliXero.Utils.Urls.api(resource, api_type)
    header = EliXero.Utils.Oauth.create_auth_header("GET", url, [oauth_token: access_token["oauth_token"]], nil, access_token)
    EliXero.Utils.Http.get(url, header)
  end

  def create(access_token, resource, api_type, data_map) do
    url = EliXero.Utils.Urls.api(resource, api_type)

    method =
      case(api_type) do
        :core -> "PUT"
      end

    header = EliXero.Utils.Oauth.create_auth_header(method, url, [oauth_token: access_token["oauth_token"]], nil, access_token)

    response =
      case(method) do
        "PUT" -> EliXero.Utils.Http.put(url, header, data_map)
      end

    response
  end

  def update(access_token, resource, api_type, data_map) do
    url = EliXero.Utils.Urls.api(resource, api_type)

    method =
      case(api_type) do
        :core -> "POST"
      end

    header = EliXero.Utils.Oauth.create_auth_header(method, url, [oauth_token: access_token["oauth_token"]], nil, access_token)

    response =
      case(method) do
        "POST" -> EliXero.Utils.Http.post(url, header, data_map)
      end

    response
  end

  def delete(access_token, resource, api_type) do
    url = EliXero.Utils.Urls.api(resource, api_type)

    header = EliXero.Utils.Oauth.create_auth_header("DELETE", url, [oauth_token: access_token["oauth_token"]], nil, access_token)

    EliXero.Utils.Http.delete(url, header)
  end

  def upload_multipart(access_token, resource, api_type, path_to_file, name) do
    url = EliXero.Utils.Urls.api(resource, api_type)

    header = EliXero.Utils.Oauth.create_auth_header("POST", url, [oauth_token: @oauth_consumer_key], [Name: name], access_token)

    EliXero.Utils.Http.upload_multipart(url, header, path_to_file, [{"Name", name}])
  end

  def upload_attachment(access_token, resource, api_type, path_to_file, filename, include_online) do
    url = EliXero.Utils.Urls.api(resource, api_type)
    url_for_signing = url <> "/" <> String.replace(filename, " ", "%20") <> "?includeonline=" <> ( if include_online, do: "true", else: "false") # spaces work dumb!
    header = EliXero.Utils.Oauth.create_auth_header("POST", url_for_signing, [oauth_token: access_token["oauth_token"]], nil, access_token)

    url = url <> "/" <> URI.encode(filename, &URI.char_unreserved?(&1)) <> "?includeonline=" <> ( if include_online, do: "true", else: "false")
    EliXero.Utils.Http.upload_attachment(url, header, path_to_file)
  end
end