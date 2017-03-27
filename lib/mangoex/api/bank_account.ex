defmodule Mangoex.API.BankAccount do
  import Mangoex.API.Base

  def create(client_id, user_id, token, body) do
    resp = request(:post, "/#{client_id}/users/#{user_id}/bankaccounts/gb/", body, token)
    decode_json(resp)
  end
end
