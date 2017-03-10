defmodule EliXero.Utils.Http do 
	
	@user_agent "EliXero - " <> Application.get_env(:elixero, :consumer_key)
	@accept "application/json"
	@content_type "application/json"

	def get(url, authorisation_header) do

		{:ok, response} = HTTPoison.get url, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}]#, [{:proxy, "127.0.0.1:8888"}]

		handle_response(response)
	end

	def put(url, authorisation_header, data_map) do
		{_, payload} = Poison.encode(data_map)
		
		{:ok, response} = HTTPoison.put url, payload, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}]#, [{:proxy, "127.0.0.1:8888"}]

		handle_response(response)
	end

	def post(url, authorisation_header, data_map) do
		{_, payload} = Poison.encode(data_map)
		
		{:ok, response} = HTTPoison.post url, payload, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}]#, [{:proxy, "127.0.0.1:8888"}]

		handle_response(response)
	end

	def delete(url, authorisation_header) do
		{:ok, response} = HTTPoison.delete url, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}]#, [{:proxy, "127.0.0.1:8888"}]

		handle_response(response)
	end

	def upload_multipart(url, authorisation_header, path_to_file, multipart_meta_data) do

		{:ok, response} = HTTPoison.post url, {:multipart, multipart_meta_data ++ [{:file, path_to_file}]}, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}]#, [{:proxy, "127.0.0.1:8888"}]

		handle_response(response)
	end

	defp handle_response(response) do
		headers = response.headers |> Map.new
		content_type = headers["Content-Type"] |> String.split(" ") |> Enum.at(0)

		case content_type do
			"application/json;" -> handle_json_response(response)
			_ -> handle_html_response(response)
		end
	end

	defp handle_json_response(response) do
		resp = %{"status_code" => response.status_code}

		{_, parsed} = Poison.Parser.parse(response.body)
		Map.merge(resp, parsed)
	end

	defp handle_html_response(response) do
		resp = %{"status_code" => response.status_code}
		URI.decode_query(response.body) |> Map.merge(resp)
	end

end