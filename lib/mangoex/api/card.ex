defmodule Mangoex.API.Card do
  import Mangoex.API.Base

  def create(client_id, token, body) do
    {:ok, resp} = request(:post, "/#{client_id}/cardregistrations", body, token)
    decode_json(resp)
  end

  def update(client_id, reg_id, token, body) do
    {:ok, resp} = request(:put, "/#{client_id}/cardregistrations/#{reg_id}", body, token)
    decode_json(resp)
  end
end
