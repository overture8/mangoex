defmodule Mangoex.API.User do
  import Mangoex.API.Base

  def create(:legal, client_id, token, body) do
    {:ok, resp} = request(:post, "/#{client_id}/users/legal", body, token)
    decode_json(resp)
  end

  def update(:legal, client_id, user_id, token, body) do
    {:ok, resp} = request(:put, "/#{client_id}/users/legal/#{user_id}/", body, token)
    decode_json(resp)
  end

  def create(:natural, client_id, token, body) do
    {:ok, resp} = request(:post, "/#{client_id}/users/natural", body, token)
    decode_json(resp)
  end

  def update(:natural, client_id, user_id, token, body) do
    {:ok, resp} = request(:put, "/#{client_id}/users/natural/#{user_id}/", body, token)
    decode_json(resp)
  end

  def list(client_id, token) do
    {:ok, resp} = request(:get, "/#{client_id}/users", token)
    decode_json(resp)
  end

  def emoney(client_id, user_id, token, body) do
    url_params = body
                 |> URI.encode_query
    {:ok, resp} = request(:get, "/#{client_id}/users/#{user_id}/emoney?#{url_params}", token)
    decode_json(resp)
  end
end
