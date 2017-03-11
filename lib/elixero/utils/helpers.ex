defmodule EliXero.Utils.Helpers do
  def random_string(length) do
      :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
  end

  def join_params_keyword(keyword, :base_string) do
    Enum.map_join(keyword, "&", fn({key, value}) -> Atom.to_string(key) <> "=" <> value end)
  end

  def join_params_keyword(keyword, :auth_header) do
    Enum.map_join(keyword, ", ", fn({key, value}) -> Atom.to_string(key) <> "=\"" <> value <> "\"" end)
  end
end