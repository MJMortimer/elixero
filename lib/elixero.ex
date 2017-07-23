defmodule EliXero do
  def get_request_token do
    response =
      case(Application.get_env(:elixero, :app_type)) do
        :private -> raise "Getting a request token is not applicable with Private applications."
        :public -> EliXero.Public.get_request_token
        :partner -> EliXero.Partner.get_request_token
      end

    case response do
      %{"http_status_code" => 200}  -> Map.merge(response, %{"auth_url" => EliXero.Utils.Urls.authorise(response["oauth_token"])})
      _                             -> response
    end
  end  

  def create_client do
    case(Application.get_env(:elixero, :app_type)) do
      :private -> %EliXero.Client{app_type: :private, access_token: %{"oauth_token" => Application.get_env(:elixero, :consumer_key)}}
      :public -> raise "Nope. Access token required"
      :partner -> raise "Nope. Access token required"
    end
  end

  def create_client(request_token, verifier) do
    response = 
      case(Application.get_env(:elixero, :app_type)) do
        :private -> raise "Approving an access token is not applicable with Private applications"
        :public -> EliXero.Public.approve_access_token(request_token, verifier)
        :partner -> EliXero.Partner.approve_access_token(request_token, verifier)
      end

    case response do
      %{"http_status_code" => 200}  -> create_client response
      _                             -> response
    end 
  end

  def renew_client(client) do
    response =
      case(Application.get_env(:elixero, :app_type)) do
        :private -> raise "Renewing an access token is not applicable with Private applications"
        :public -> raise "Renewing an access token is not applicable with Public applications"
        :partner -> EliXero.Partner.renew_access_token(client.access_token)
      end

    case response do
      %{"http_status_code" => 200}  -> create_client response
      _                             -> response
    end 
  end

  defp create_client(access_token) do
    case(Application.get_env(:elixero, :app_type)) do
      :private -> raise "Nope. No need for access token"
      :public -> %EliXero.Client{app_type: :public, access_token: access_token}
      :partner -> %EliXero.Client{app_type: :partner, access_token: access_token}
    end
  end
end