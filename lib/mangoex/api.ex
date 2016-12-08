defmodule Mangoex.Api do
  @spec authenticate(String.t, String.t) :: tuple()
  defdelegate authenticate(client_id, client_pass),
    to: Mangoex.API.Authenticate

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
end
