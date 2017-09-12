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

  @doc """
  Creates a User on MangoPay
  pattern match LegalPersonType to create a legal user

  ## Examples
      iex> Mangoex.Client.auth("CLIENT_ID", "PASSPHRASE")
      iex> params = %{
        FirstName: "Joe",
        LastName: "Blogs",
        Address: %{
          AddressLine1: "1 Mangopay Street",
          AddressLine2: "The Loop",
          City: "Paris",
          Region: "Ile de France",
          PostalCode: "75001",
          Country: "FR"
        },
        Birthday: 1463496101,
        Nationality: "GB",
        CountryOfResidence: "FR",
        Email: "test@mangopay.com"
      }
      iex> Mangoex.Client.create_user(params)
      {:ok,
       %{"Address" => %{"AddressLine1" => "1 Mangopay Street",
           "AddressLine2" => "The Loop", "City" => "Paris", "Country" => "FR",
           "PostalCode" => "75001", "Region" => "Ile de France"},
         "Birthday" => 1463496101, "Capacity" => "NORMAL",
         "CountryOfResidence" => "FR", "CreationDate" => 1501165918,
         "Email" => "test@mangopay.com", "FirstName" => "Joe", "Id" => "30091968",
         "IncomeRange" => nil, "KYCLevel" => "LIGHT", "LastName" => "Blogs",
         "Nationality" => "GB", "Occupation" => nil, "PersonType" => "NATURAL",
         "ProofOfAddress" => nil, "ProofOfIdentity" => nil, "Tag" => nil}}
  """
  @callback create_user(map()) :: tuple()

  @doc """
  Updates a User on the system
  pattern match LegalPersonType to update a legal user


  ## Examples
      iex> Mangoex.Client.auth("CLIENT_ID", "PASSPHRASE")
      iex> params = %{FirstName: "Updated"}
      iex> Mangoex.Client.update_user("00000001", params)
      {:ok,
       %{"Address" => %{"AddressLine1" => "1 Mangopay Street",
           "AddressLine2" => "The Loop", "City" => "Paris", "Country" => "FR",
           "PostalCode" => "75001", "Region" => "Ile de France"},
         "Birthday" => 1463496101, "Capacity" => "NORMAL",
         "CountryOfResidence" => "FR", "CreationDate" => 1501165918,
         "Email" => "test@mangopay.com", "FirstName" => "Updated", "Id" => "00000001",
         "IncomeRange" => nil, "KYCLevel" => "LIGHT", "LastName" => "Blogs",
         "Nationality" => "GB", "Occupation" => nil, "PersonType" => "NATURAL",
         "ProofOfAddress" => nil, "ProofOfIdentity" => nil, "Tag" => nil}}
  """
  @callback update_user(String.t, map()) :: tuple()

  @callback list_users() :: tuple()
  @callback create_payin(:bankwire_direct | :card_direct, map()) :: tuple()
  @callback create_payout(map()) :: tuple()
  @callback get_payin(String.t) :: tuple()
  @callback create_refund(:payin | :transfer, String.t, map()) :: tuple()
  @callback create_card(map()) :: tuple()
  @callback create_wallet(map()) :: tuple()

  @doc """
  Returns a Wallet

  ## Examples
      iex> Mangoex.Client.auth("CLIENT_ID", "PASSPHRASE")
      iex> Mangoex.Client.get_wallet("99999999")
      {:ok,
       %{"Balance" => %{"Amount" => 2716,
           "Currency" => "GBP"},
         "CreationDate" => 1493386336,
         "Currency" => "GBP",
         "Description" => "test",
         "FundsType" => "DEFAULT", "Id" => "99999999",
         "Owners" => ["99999999"]}

  """
  @callback get_wallet(String.t) :: tuple()
  @callback create_bank_account(:gb, String.t, map()) :: tuple()
  @callback create_bank_account(:iban, String.t, map()) :: tuple()
  @callback create_kyc_document(String.t, map()) :: tuple()

  @doc """
  Checks a User's KYC document status.

  ## Examples
      iex> Mangoex.Client.auth("CLIENT_ID", "PASSPHRASE")
      iex> Mangoex.Client.check_kyc_document("99999999")
      {:ok,
       %{"CreationDate" => 1498207261, "Id" => "99999999",
         "RefusedReasonMessage" => nil, "RefusedReasonType" => nil,
         "Status" => "VALIDATION_ASKED", "Tag" => nil, "Type" => "ADDRESS_PROOF",
         "UserId" => "25015768"}}
  """
  @callback check_kyc_document(String.t) :: tuple()

  @doc """
  Checks a User's emoney status.

  ## Examples
      iex> Mangoex.Client.auth("CLIENT_ID", "PASSPHRASE")
      iex> Mangoex.Client.check_users_emoney("99999999", %{})
      {:ok,
       %{"CreditedEMoney" => %{"Amount" => 0, "Currency" => "EUR"},
         "DebitedEMoney" => %{"Amount" => 0, "Currency" => "EUR"},
         "UserId" => "99999999"}}

      iex> Mangoex.Client.check_users_emoney("99999999", %{Currency: "GBP"})
      {:ok,
       %{"CreditedEMoney" => %{"Amount" => 0, "Currency" => "GBP"},
         "DebitedEMoney" => %{"Amount" => 0, "Currency" => "GBP"},
         "UserId" => "99999999"}}
  """
  @callback check_users_emoney(String.t, map()) :: tuple()

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

  @callback create_transfer(map()) :: tuple()

end
