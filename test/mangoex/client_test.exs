defmodule Mangoex.ClientTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock

  setup_all do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")

    use_cassette "authenticate" do
      Mangoex.Client.start_link
      Mangoex.Client.auth(
        System.get_env("MANGOEX_CLIENT_ID"),
        System.get_env("MANGOEX_CLIENT_PASS")
      )
    end

    :ok
  end

  test "list_users" do
    use_cassette "list_users" do
      {:ok, response} = Mangoex.Client.list_users
      assert List.first(response)["Email"] == "info@mangopay.com"
    end
  end

  test "create_payin_bankwire" do
    use_cassette "create_payin_bankwire" do
      body = %{
        AuthorId: "18168497",
        CreditedUserId: "18168497",
        CreditedWalletId: "18168742",
        DeclaredDebitedFunds: %{
          Currency: "GBP",
          Amount: 10
        },
        DeclaredFees: %{
          Currency: "GBP",
          Amount: 0
        }
      }

      {:ok, response} = Mangoex.Client.create_payin(:bankwire_direct, body)
      assert response["PaymentType"] == "BANK_WIRE"
    end
  end
end
