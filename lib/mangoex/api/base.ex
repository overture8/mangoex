defmodule Mangoex.API.Base do
  @api_base Application.fetch_env!(:mangoex, :api_base)

  def request(:auth, client_id, client_pass) do
    token = encode_auth(client_id, client_pass)

    HTTPotion.post api_url("/oauth/token"),
      [
        body: "grant_type=" <> URI.encode_www_form("client_credentials"),
        headers: [
          "Authorization": "Basic #{token}",
          "Content-Type": "application/x-www-form-urlencoded"]
      ]
  end

  def request(:get, path, token) do
    HTTPotion.get api_url(path),
      [
        headers: ["Authorization": "Bearer #{token}"]
      ]
  end

  def request(:post, path, body, token) do
    encoded_body = body |> Poison.encode!

    HTTPotion.post api_url(path),
      [
        body: encoded_body,
        headers: [
          "Authorization": "Bearer #{token}",
          "Content-Type": "application/json"
        ]
      ]
  end

  def request(:put, path, body, token) do
    encoded_body = body |> Poison.encode!

    HTTPotion.put api_url(path),
      [
        body: encoded_body,
        headers: [
          "Authorization": "Bearer #{token}",
          "Content-Type": "application/json"
        ]
      ]
  end

  def decode_json(resp_map) do
    body = resp_map.body
    |> Poison.decode!

    case resp_map.status_code do
      200 -> {:ok, body}
      x when x > 200 -> {:error, body}
    end
  end

  defp api_url(url) do
    @api_base <> url
  end

  defp encode_auth(client_id, client_password) do
    :base64.encode_to_string("#{client_id}:#{client_password}")
  end
end
