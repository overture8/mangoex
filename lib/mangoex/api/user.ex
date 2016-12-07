defmodule Mangoex.API.User do
  import Mangoex.API.Base

  def list(client_id, token) do
    resp = request(:get, "/#{client_id}/users", token)
    decode_json(resp)
  end
end
