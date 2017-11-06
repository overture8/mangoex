defmodule Mangoex.API.Wallet do
  import Mangoex.API.Base

  def create(client_id, token, body) do
    {:ok, resp} = request(:post, "/#{client_id}/wallets", body, token)
    decode_json(resp)
  end

  def get(client_id, wallet_id, token) do
    {:ok, resp} = request(:get, "/#{client_id}/wallets/#{wallet_id}", token)
    decode_json(resp)
  end
end
