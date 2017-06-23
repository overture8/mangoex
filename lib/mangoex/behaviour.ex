defmodule Mangoex.Behaviour do
  @callback auth(String.t, String.t) :: tuple()
  @callback list_users() :: tuple()
  @callback create_payin(:bankwire_direct | :card_direct, map()) :: tuple()
  @callback get_payin(String.t) :: tuple()
  @callback create_refund(:payin | :transfer, String.t, map()) :: tuple()
  @callback create_card(map()) :: tuple()
  @callback create_wallet(map()) :: tuple()
  @callback create_bank_account(:gb, String.t, map()) :: tuple()
  @callback create_kyc_document(String.t, map()) :: tuple()
  @callback create_kyc_page(String.t, String.t, map()) :: tuple()
end
