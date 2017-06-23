defmodule Mangoex.Behaviour do
  @moduledoc """
  Public API for MangoEx
  """

  @doc """
  Authorises Mangoex to use MangoPay

  ## Examples
      iex> Mangoex.Client.auth("CLIENT_ID", "PASSPHRASE")
      {:ok,
      %{"access_token" => "99999999999999999999", "expires_in" => 1199, "token_type" => "bearer"}
  """
  @callback auth(String.t, String.t) :: tuple()
  @callback list_users() :: tuple()
  @callback create_payin(:bankwire_direct | :card_direct, map()) :: tuple()
  @callback get_payin(String.t) :: tuple()
  @callback create_refund(:payin | :transfer, String.t, map()) :: tuple()
  @callback create_card(map()) :: tuple()
  @callback create_wallet(map()) :: tuple()
  @callback create_bank_account(:gb, String.t, map()) :: tuple()
  @callback create_kyc_document(String.t, map()) :: tuple()

  @doc """
  Submits a KYC document for validation by MangoPay

  ## Examples
      iex> Mangoex.Client.auth("CLIENT_ID", "PASSPHRASE")
      iex> Mangoex.Client.submit_kyc_document("99999999","99999999", %{Status: "VALIDATION_ASKED"})
      {:ok,
      %{"CreationDate" => 1498207261, "Id" => "99999999",
       "RefusedReasonMessage" => nil, "RefusedReasonType" => nil,
       "Status" => "VALIDATION_ASKED", "Tag" => nil, "Type" => "ADDRESS_PROOF",
       "UserId" => "99999999"}}
  """
  @callback submit_kyc_document(String.t, String.t, map()) :: tuple()

  @callback create_kyc_page(String.t, String.t, map()) :: tuple()
end
