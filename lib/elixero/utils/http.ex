defmodule EliXero.Utils.Http do 
	
	@user_agent "EliXero - " <> Application.get_env(:elixero, :consumer_key)
	@accept "application/json"
	@content_type "application/json"

	def get(url, authorisation_header) do

		{:ok, response} = HTTPoison.get url, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}]

		#IO.inspect response
		headers = response.headers |> Map.new
		content_type = headers["Content-Type"] |> String.split(" ") |> Enum.at(0)

		case content_type do
			"application/json;" -> handle_json_response(response)
			_ -> handle_html_response(response)
		end
	end

	def handle_json_response(response) do
		{_, resp} = Poison.Parser.parse(response.body)
		resp
	end

	def handle_html_response(response) do
		URI.decode_query(response.body)
	end

end