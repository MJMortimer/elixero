defmodule EliXero.CoreApi.Utils.ResponseHandler do
    def handle_response(response, expected_model) do
        case response do
            %{:status_code => 200} -> json_to_module response.body, expected_model
            _ -> "The request went wrong, but I'm not handling it yet"
        end
    end

    defp json_to_module(json, module) do
    case (Poison.decode json, keys: :atoms) do
      {:ok, data} -> module.from_map data
      _ -> "Something went wrong transforming to module"
    end
  end
end