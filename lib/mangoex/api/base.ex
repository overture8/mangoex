defmodule Mangoex.API.Base do
  def request(:auth, client_id, client_pass) do
    token = encode_auth(client_id, client_pass)
    data = %{grant_type: "client_credentials"} |> Poison.encode!()

    HTTPoison.post! api_url("/oauth/token"), data, [
      {"Authorization", "Basic #{token}"},
      {"Content-Type", "application/x-www-form-urlencoded"}
    ]
  end

  def request(:get, path, token) do
    HTTPoison.get! api_url(path), build_headers(token)
  end

  def request(:post, path, body, token), do:
    request(:post, path, body, token, nil)
  def request(:post, path, body, token, idempotency) do
    data = body|> Poison.encode!()

    HTTPoison.post! api_url(path), data, build_headers(token, idempotency)
  end

  def request(:put, path, body, token) do
    data = body |> Poison.encode!()

    HTTPoison.put! api_url(path), data, build_headers(token)
  end

  defp build_headers(token) do
    [
      {"Authorization", "Bearer #{token}"},
      {"Content-Type", "application/json"}
    ]
  end

  defp build_headers(token, nil), do:
    build_headers(token)
  defp build_headers(token, idempotency) do
    [{"Idempotency-Key", "#{idempotency}"} | build_headers(token)]
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
