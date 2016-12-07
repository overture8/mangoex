defmodule Mangoex.API.Payin do
  import Mangoex.API.Base

  def create(:bankwire_direct, client_id, token, body) do
    resp = request(:post, "/#{client_id}/payins/bankwire/direct", body, token)
    decode_json(resp)
  end
end
