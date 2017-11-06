defmodule Mangoex.API.Base do
  def request(:auth, client_id, client_pass) do
    token = encode_auth(client_id, client_pass)

    HTTPoison.post api_url("/oauth/token"),
                   Poison.encode!("grant_type=" <> URI.encode_www_form("client_credentials")),
                   [
                     {"Authorization", "Basic #{token}"},
                     {"Content-Type", "application/x-www-form-urlencoded"}
                   ]

  end

  def request(:get, path, token) do
    HTTPoison.get api_url(path),
                  [{"Authorization", "Bearer #{token}"}]
  end

  def request(:post, path, body, token) do
    encoded_body = body
                   |> Poison.encode!

    HTTPoison.post api_url(path),
                   encoded_body,
                   [
                     {"Authorization", "Bearer #{token}"},
                     {"Content-Type", "application/json"}
                   ]
  end

  def request(:put, path, body, token) do
    encoded_body = body
                   |> Poison.encode!

    HTTPoison.put api_url(path),
                  encoded_body,
                  [
                    {"Authorization", "Bearer #{token}"},
                    {"Content-Type", "application/json"}
                  ]
  end

  @doc """
  Decodes JSON returned when a file upload has taken place.

  This mimics behaviour in the Ruby implementation which points out that file
  uploads return a 204 rather than a 200.
  """
  def decode_json(:upload, {:badkey, :body, %{message: "req_timedout"}}) do
    {:error, "Request Timeout"}
  end
  def decode_json(:upload, resp_map) do
    body = case resp_map.body do
      "" -> "No Body"
      body -> Poison.decode!(body)
    end

    case resp_map.status_code do
      204 -> {:ok, "Document Uploaded Successfully"}
      x when x > 204 -> {:error, body}
    end
  end

  def decode_json({:badkey, :body, %{message: "req_timedout"}}) do
    {:error, "Request Timeout"}
  end
  def decode_json(resp_map) do
    body = case resp_map.body do
      "" -> "No Body"
      body -> Poison.decode!(body)
    end

    case resp_map.status_code do
      200 -> {:ok, body}
      x when x > 200 -> {:error, body}
    end
  end

  defp api_url(url) do
    Application.fetch_env!(:mangoex, :api_base) <> url
  end

  defp encode_auth(client_id, client_password) do
    :base64.encode_to_string("#{client_id}:#{client_password}")
  end
end
