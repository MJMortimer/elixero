defmodule EliXero.CoreApi.Utils.ResponseHandler do
    def handle_response(response, expected_model) do
        case response do
            %{:status_code => 200}  -> transform response.body, expected_model, :ok
            %{:status_code => 204}  -> %{:status_code => 204, :message => "No Content"}
            %{:status_code => 400}  -> transform response.body, expected_model, :bad_request
            %{:status_code => 500}  -> transform_to_api_exception response.body
            _                       -> %{:status_code => response.status_code, :message => response.body}
        end
    end

    defp transform(json, module, :ok) do
        case (Poison.decode json, keys: :atoms) do
            {:ok, data} -> module.from_map data
            _ -> "Something went wrong transforming to module"
        end
    end

    defp transform(json, module, :bad_request) do
        case (Poison.decode json, keys: :atoms) do
            {:ok, %{:ErrorNumber => 10} = data} -> module.from_validation_exception data
            {:ok, data}                         -> data
            _                                   -> "Something went wrong transforming to module"
        end
    end

    defp transform_to_api_exception(json) do
        case (Poison.decode json, keys: :atoms) do
            {:ok, data} -> EliXero.CoreApi.Models.Exceptions.ApiException.from_map data
            _ -> "Something went wrong transforming to module"
        end
    end
end