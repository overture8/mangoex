defmodule Mangoex.ClientTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock

  setup_all do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")

    use_cassette "authenticate" do
      Mangoex.Client.start_link
      Mangoex.Client.auth("client_id", "client_pass")
    end

    :ok
  end

  test "list_users" do
    use_cassette "list_users" do
      {:ok, response} = Mangoex.Client.list_users
      assert response =~ ~r/info@mangopay.com/
    end
  end
end
