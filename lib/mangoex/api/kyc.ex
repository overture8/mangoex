defmodule Mangoex.API.Kyc do
  import Mangoex.API.Base

  def create(client_id, user_id, token, body) do
    resp = request(:post, "/#{client_id}/users/#{user_id}/kyc/documents", body, token)
    decode_json(resp)
  end

  def create_page(client_id, user_id, kyc_document_id, token, body) do
    resp = request(:post, "/#{client_id}/users/#{user_id}/kyc/documents/#{kyc_document_id}/pages", body, token)
    decode_json(:upload, resp)
  end
end
