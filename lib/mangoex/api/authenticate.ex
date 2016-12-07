defmodule Mangoex.API.Authenticate do
  import Mangoex.API.Base

  def authenticate(client_id, client_pass) do
    resp = request(:auth, client_id, client_pass)
    decode_json(resp)
  end
end
