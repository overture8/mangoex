# Mangoex

`mangoex` is a wrapper for the MangoPay API written in Elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `mangoex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:mangoex, "~> 0.4.0"}]
end
```

  2. Ensure `mangoex` is started before your application:

```elixir
def application do
  [applications: [:mangoex]]
end
```

 3. You may need to specify the SSL protocol version in your `confix.ex` for Erlang 19:

```elixir
config :ssl, protocol_version: :"tlsv1.2"
```

 4. Add api_base config to you `confix.ex`:

```elixir
config :mangoex,
  api_base: "https://api.sandbox.mangopay.com/v2.01"
```

## Usage

```elixir
Mangoex.Client.auth("client_id", "client_pass")

body = %{
  Owners: ["12341234"],
  Description: "Wallet name",
  Currency: "GBP"
}

result = Mangoex.Client.create_wallet(body)

case result do
  {:ok, response} -> ...
  {:error, error_message} -> ...
end
```

## Implementation state

These are the priorities for me right now. If you want anything else feel free to add a pull request.

- [x] Users
  - [x] Create natural user
  - [x] Update natural user
  - [x] Create legal user
  - [x] Update legal user
  - [x] List users
  - [x] Get eMoney values
- [ ] Wallets
  - [x] Create wallet
  - [ ] Update wallet
  - [x] Get wallet
- [x] PayIns
  - [x] Create bankwire direct PayIn
  - [x] Create card direct PayIn
  - [x] Get PayIn
  - [x] PayIn Refund
- [x] PayOuts
 	- [x] Create PayOut
 	- [x] View PayOut
- [x] KYC
 	- [x] Create document
  - [x] Create a KYC page
  - [x] Submit a KYC document
 	- [x] View document   
- [x] Transfers
 	- [x] Create Transfer
- [x] BankAccounts
 	- [x] Create GB bank account
 	- [x] Create IBAN bank account
- [x] Cards
  - [x] Create card registration
  - [x] Update card registration

## License

The `mangoex` lib is released under the [MIT License](http://www.opensource.org/licenses/MIT).
