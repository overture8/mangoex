defmodule Mangoex.API.Payin do
  import Mangoex.API.Base

  def get(client_id, payin_id, token) do
    {:ok, resp} = request(:get, "/#{client_id}/payins/#{payin_id}", token)
    decode_json(resp)
  end

  def create(:bankwire_direct, client_id, token, body) do
    {:ok, resp} = request(:post, "/#{client_id}/payins/bankwire/direct", body, token)
    decode_json(resp)
  end

  def create(:card_direct, client_id, token, body) do
    {:ok, resp} = request(:post, "/#{client_id}/payins/card/direct", body, token)
    decode_json(resp)
  end
end
