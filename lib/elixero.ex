defmodule EliXero do
  def get_request_token do
    case(Application.get_env(:elixero, :app_type)) do
      :private -> raise "Getting a request token is not applicable with Private applications."
      :public -> EliXero.Public.get_request_token
      :partner -> EliXero.Partner.get_request_token
    end
  end

  def generate_auth_url(request_token) do
    case(Application.get_env(:elixero, :app_type)) do
      :private -> raise "Generating an auth url is not applicable for Private applications"
      :public -> EliXero.Public.generate_auth_url(request_token)
      :partner -> EliXero.Partner.generate_auth_url(request_token)
    end
  end

  def approve_access_token(request_token, verifier) do
    case(Application.get_env(:elixero, :app_type)) do
      :private -> raise "Approving an access token is not applicable with Private applications"
      :public -> EliXero.Public.approve_access_token(request_token, verifier)
      :partner -> EliXero.Partner.approve_access_token(request_token, verifier)
    end
  end

  def renew_access_token(access_token) do
    case(Application.get_env(:elixero, :app_type)) do
      :private -> raise "Renewing an access token is not applicable with Private applications"
      :public -> raise "Renewing an access token is not applicable with Public applications"
      :partner -> EliXero.Partner.renew_access_token(access_token)
    end
  end

  def create_client do
    case(Application.get_env(:elixero, :app_type)) do
      :private -> %EliXero.Client{app_type: :private, access_token: %{"oauth_token" => Application.get_env(:elixero, :consumer_key)}}
      :public -> raise "Nope. Access token required"
      :partner -> raise "Nope. Access token required"
    end
  end

  def create_client(access_token) do
    case(Application.get_env(:elixero, :app_type)) do
      :private -> raise "Nope. No need for access token"
      :public -> %EliXero.Client{app_type: :public, access_token: access_token}
      :partner -> %EliXero.Client{app_type: :partner, access_token: access_token}
    end
  end
end