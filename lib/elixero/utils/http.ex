defmodule EliXero.Utils.Http do 
  
  @user_agent "EliXero - " <> Application.get_env(:elixero, :consumer_key)
  @accept "application/json"
  @content_type "application/json"

  @connection_timeout 330000

  def get(url, authorisation_header) do

    {:ok, response} = HTTPoison.get url, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}], [{:recv_timeout, @connection_timeout}] # ++ [{:proxy, "127.0.0.1:8888"}]

    handle_response(response)
  end

  def put(url, authorisation_header, data_map) do
    {_, payload} = Poison.encode(data_map)
    
    {:ok, response} = HTTPoison.put url, payload, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}], [{:recv_timeout, @connection_timeout}] # ++ [{:proxy, "127.0.0.1:8888"}]

    handle_response(response)
  end

  def post(url, authorisation_header, data_map) do
    {_, payload} = Poison.encode(data_map)
    
    {:ok, response} = HTTPoison.post url, payload, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}], [{:recv_timeout, @connection_timeout}] # ++ [{:proxy, "127.0.0.1:8888"}]

    handle_response(response)
  end

  def delete(url, authorisation_header) do
    {:ok, response} = HTTPoison.delete url, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}], [{:recv_timeout, @connection_timeout}] # ++ [{:proxy, "127.0.0.1:8888"}]

    handle_response(response)
  end

  def upload_multipart(url, authorisation_header, path_to_file, multipart_meta_data) do

    {:ok, response} = HTTPoison.post url, {:multipart, multipart_meta_data ++ [{:file, path_to_file}]}, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}], [{:recv_timeout, @connection_timeout}] # ++ [{:proxy, "127.0.0.1:8888"}]

    handle_response(response)
  end

  def upload_attachment(url, authorisation_header, path_to_file) do
    {:ok, response} = HTTPoison.post url, {:file, path_to_file}, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}], [{:recv_timeout, @connection_timeout}] # ++ [{:proxy, "127.0.0.1:8888"}]

    handle_attachment_response(response)
  end

  defp handle_response(response) do

    headers = response.headers |> Map.new
    content_type = headers["Content-Type"]

    case content_type do
      nil -> handle_html_response(response)
      _ -> handle_response(response, content_type)
    end
  end

  defp handle_response(response, content_type) do
    content_type = String.split(content_type, " ") |> Enum.at(0)

    case content_type do
      "application/json;" -> handle_json_response(response)
      _ -> handle_html_response(response)
    end
  end

  defp handle_json_response(response) do
    resp = %{"http_status_code" => response.status_code}

    {_, parsed} = Poison.Parser.parse(response.body)
    Map.merge(resp, parsed)
  end

  defp handle_html_response(response) do
    resp = %{"http_status_code" => response.status_code}
    URI.decode_query(response.body) |> Map.merge(resp)
  end

  defp handle_attachment_response(response) do
    %{"data" => response.body, "http_status_code" => response.status_code}
  end
end