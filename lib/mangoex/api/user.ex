defmodule Mangoex.API.User do
  import Mangoex.API.Base

  def list(client_id, token) do
    resp = request(:get, "/#{client_id}/users", token)
    decode_json(resp)
  end

  def emoney(client_id, user_id, token, body) do
    url_params = body |> URI.encode_query
    resp = request(:get, "/#{client_id}/users/#{user_id}/emoney?#{url_params}", token)
    decode_json(resp)
  end
end
