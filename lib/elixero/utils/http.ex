defmodule EliXero.Utils.Http do 
	
	@user_agent "EliXero - " <> Application.get_env(:elixero, :consumer_key)
	@accept "application/json"
	@content_type "application/json"

	def get(url, authorisation_header) do

		{:ok, response} = HTTPoison.get url, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}]#, [{:proxy, "127.0.0.1:8888"}]

		#IO.inspect response.status_code
		
		handle_response(response)
	end

	def put(url, authorisation_header, data_map) do
		{_, payload} = Poison.encode(data_map)
		IO.inspect(payload)
		
		{:ok, response} = HTTPoison.put url, payload, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}]#, [{:proxy, "127.0.0.1:8888"}]

		#IO.inspect response

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