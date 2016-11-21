defmodule EliXero.Utils.Http do 
	
	@user_agent "EliXero - " <> Application.get_env(:elixero, :consumer_key)
	@accept "application/json"
	@content_type "application/json"

	def get(url, authorisation_header) do
		{:ok, response} = HTTPoison.get url, [{"Authorization", authorisation_header}, {"Accept", @accept}, {"User-Agent", @user_agent}]
		URI.decode_query(response.body)
	end

end