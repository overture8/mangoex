defmodule Mangoex.API.Refund do
  import Mangoex.API.Base

  def create(:payin, client_id, payin_id, token, body) do
    {:ok, resp} = request(:post, "/#{client_id}/payins/#{payin_id}/refunds", body, token)
    decode_json(resp)
  end
end
