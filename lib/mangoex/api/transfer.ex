defmodule Mangoex.API.Transfer do
  import Mangoex.API.Base

  def create(client_id, token, body) do
    resp = request(:post, "/#{client_id}/transfers", body, token)
    decode_json(resp)
  end

  def get(client_id, transfer_id, token) do
    resp = request(:get, "/#{client_id}/transfers/#{transfer_id}", token)
    decode_json(resp)
  end
end
