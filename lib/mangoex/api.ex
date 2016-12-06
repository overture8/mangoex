defmodule Mangoex.Api do
  @api_base Application.fetch_env!(:mangoex, :api_base)

  def authenticate(client_id, client_pass) do
    token = encode_auth(client_id, client_pass)

    url = api_url("/oauth/token")
    resp = HTTPotion.post url,
      [
        body: "grant_type=" <> URI.encode_www_form("client_credentials"),
        headers: [
          "Authorization": "Basic #{token}",
          "Content-Type": "application/x-www-form-urlencoded"]
      ]

    decode_json(resp)
  end

  def list_users(client_id, token) do
    url = api_url("/#{client_id}/users")
    resp = HTTPotion.get url,
      [
        headers: ["Authorization": "Bearer #{token}"]
      ]

    decode_json(resp)
  end

  def create_payin(:bankwire_direct, client_id, token, body) do
    url = api_url("/#{client_id}/payins/bankwire/direct")
    resp = HTTPotion.post url, post_params(body, token)
    decode_json(resp)
  end

  def create_wallet(client_id, token, body) do
    url = api_url("/#{client_id}/wallets")
    resp = HTTPotion.post url, post_params(body, token)
    decode_json(resp)
  end

  defp api_url(url) do
    @api_base <> url
  end

  defp post_params(body, token) do
    encoded_body = body |> Poison.encode!

    [
      body: encoded_body,
      headers: [
        "Authorization": "Bearer #{token}",
        "Content-Type": "application/json"
      ]
    ]
  end

  defp decode_json(resp_map) do
    body = resp_map.body
    |> Poison.decode!

    case resp_map.status_code do
      200 -> {:ok, body}
      x when x > 200 -> {:error, body}
    end
  end

  defp encode_auth(client_id, client_password) do
    :base64.encode_to_string("#{client_id}:#{client_password}")
  end
end
