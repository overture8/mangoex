defmodule Mangoex.Api do
  @spec authenticate(String.t, String.t) :: tuple()
  defdelegate authenticate(client_id, client_pass),
    to: Mangoex.API.Authenticate

  @spec create_user(
    String.t,
    String.t,
    map()
  ) :: tuple()
  defdelegate create_user(client_id, token, body),
    to: Mangoex.API.User,
    as: :create

  @spec update_user(
    String.t,
    String.t,
    String.t,
    map()
  ) :: tuple()
  defdelegate update_user(client_id, user_id, token, body),
    to: Mangoex.API.User,
    as: :update

  @spec list_users(String.t, String.t) :: tuple()
  defdelegate list_users(client_id, token),
    to: Mangoex.API.User,
    as: :list

  @spec create_payin(
    :bankwire_direct | :card_direct,
    String.t,
    String.t,
    map()
  ) :: tuple()
  defdelegate create_payin(type, client_id, token, body),
    to: Mangoex.API.Payin,
    as: :create

  @spec get_payin(
    String.t,
    String.t,
    String.t
  ) :: tuple()
  defdelegate get_payin(client_id, payin_id, token),
    to: Mangoex.API.Payin,
    as: :get

  @spec create_refund(
    :payin | :transfer,
    String.t,
    String.t,
    String.t,
    map()
  ) :: tuple()
  defdelegate create_refund(type, client_id, payin_id, token, body),
    to: Mangoex.API.Refund,
    as: :create

  @spec create_card(String.t, String.t, map()) :: tuple()
  defdelegate create_card(client_id, token, body),
    to: Mangoex.API.Card,
    as: :create

  @spec create_wallet(String.t, String.t, map()) :: tuple()
  defdelegate create_wallet(client_id, token, body),
    to: Mangoex.API.Wallet,
    as: :create

  @spec get_wallet(String.t, String.t, String.t) :: tuple()
  defdelegate get_wallet(client_id, wallet_id, token),
    to: Mangoex.API.Wallet,
    as: :get

  @spec create_gb_bank_account(
    String.t,
    String.t,
    String.t,
    map()
  ) :: tuple()
  defdelegate create_gb_bank_account(client_id, user_id, token, body),
    to: Mangoex.API.BankAccount,
    as: :create

  @spec create_kyc_document(String.t,
    String.t,
    String.t,
    map()
  ) :: tuple()
  defdelegate create_kyc_document(client_id, user_id, token, body),
    to: Mangoex.API.Kyc,
    as: :create

  @spec create_kyc_page(
    String.t,
    String.t,
    String.t,
    String.t,
    map()
  ) :: tuple()
  defdelegate create_kyc_page(client_id, user_id, kyc_document_id, token, body),
    to: Mangoex.API.Kyc,
    as: :create_page

  @spec submit_kyc_document(
    String.t,
    String.t,
    String.t,
    String.t,
    map()
  ) :: tuple()
  defdelegate submit_kyc_document(client_id, user_id, kyc_document_id, token, body),
    to: Mangoex.API.Kyc,
    as: :submit

  @spec check_kyc_document(String.t, String.t, String.t) :: tuple()
  defdelegate check_kyc_document(client_id, kyc_document_id, token),
    to: Mangoex.API.Kyc,
    as: :check

  @spec check_users_emoney(
    String.t,
    String.t,
    String.t,
    map()
  ) :: tuple()
  defdelegate check_users_emoney(client_id, user_id, token, body),
    to: Mangoex.API.User,
    as: :emoney

  @spec create_transfer(String.t, String.t, map()) :: tuple()
  defdelegate create_transfer(client_id, token, body),
    to: Mangoex.API.Transfer,
    as: :create

  @spec create_payout(String.t, String.t, map()) :: tuple()
  defdelegate create_payout(client_id, token, body),
    to: Mangoex.API.Payout,
    as: :create

  @spec get_payout(
    String.t,
    String.t,
    String.t
  ) :: tuple()
  defdelegate get_payout(client_id, payout_id, token),
    to: Mangoex.API.Payout,
    as: :get
end
