defmodule Mangoex.API.Payout do
  import Mangoex.API.Base

  def get(client_id, token, payout_id) do
    resp = request(:get, "/#{client_id}/payouts/#{payout_id}", token)
    decode_json(resp)
  end

  def create(client_id, token, body) do
    resp = request(:post, "/#{client_id}/payouts/bankwire/", body, token)
    decode_json(resp)
  end
end
