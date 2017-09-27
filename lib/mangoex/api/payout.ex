defmodule Mangoex.API.Payout do
  import Mangoex.API.Base

  def create(client_id, token, body) do
    resp = request(:post, "/#{client_id}/payouts/bankwire/", body, token)
    decode_json(resp)
  end
end
