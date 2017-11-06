defmodule Mangoex.API.Kyc do
  import Mangoex.API.Base

  def create(client_id, user_id, token, body) do
    {:ok, resp} = request(:post, "/#{client_id}/users/#{user_id}/kyc/documents", body, token)
    decode_json(resp)
  end

  def create_page(client_id, user_id, kyc_document_id, token, body) do
    {:ok, resp} = request(:post, "/#{client_id}/users/#{user_id}/kyc/documents/#{kyc_document_id}/pages", body, token)
    decode_json(:upload, resp)
  end

  def submit(client_id, user_id, kyc_document_id, token, body) do
    {:ok, resp} = request(:put, "/#{client_id}/users/#{user_id}/kyc/documents/#{kyc_document_id}", body, token)
    decode_json(resp)
  end

  def check(client_id, kyc_document_id, token) do
    {:ok, resp} = request(:get, "/#{client_id}/kyc/documents/#{kyc_document_id}", token)
    decode_json(resp)
  end
end
