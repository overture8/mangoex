# Mangoex

`mangoex` is a wrapper for the MangoPay API written in Elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `mangoex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:mangoex, "~> 0.1.2"}]
    end
    ```

  2. Ensure `mangoex` is started before your application:

    ```elixir
    def application do
      [applications: [:mangoex]]
    end
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

- [ ] Users
  - [ ] Create natural user
  - [ ] Update natural user
  - [x] List users
- [ ] Wallets
  - [x] Create wallet
  - [ ] Update wallet
- [x] PayIns
  - [x] Create bankwire direct PayIn
  - [x] Create card direct PayIn
  - [x] Get PayIn
  - [x] PayIn Refund
- [ ] PayOuts
 	- [ ] Create PayOut
 	- [ ] View PayOut
- [ ] Transfers
 	- [ ] Create Transfer
- [x] BankAccounts
 	- [x] Create GB bank account
- [ ] Cards
  - [ ] Create card registration
  - [ ] Update card registration

## License

The `mangoex` lib is released under the [MIT License](http://www.opensource.org/licenses/MIT).
