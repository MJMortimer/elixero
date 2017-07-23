defmodule EliXero.CoreApi.Utils.ResponseHandler do
    def handle_response(response, expected_model) do
        case response do
            %{:status_code => 200} -> json_to_module response.body, expected_model, :ok
            %{:status_code => 204} -> %{:status_code => 204}
            %{:status_code => 400} -> json_to_module response.body, expected_model, :bad_request
            %{:status_code => 404} -> %{:status_code => 404}
            _ -> response
        end
    end

    defp json_to_module(json, module, :ok) do
        case (Poison.decode json, keys: :atoms) do
            {:ok, data} -> module.from_map data
            _ -> "Something went wrong transforming to module"
        end
    end

    defp json_to_module(json, module, :bad_request) do
        case (Poison.decode json, keys: :atoms) do
            {:ok, data} -> module.from_validation_exception data
            _ -> "Something went wrong transforming to module"
        end
    end
end