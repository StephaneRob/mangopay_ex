# MangopayEx (WIP)

Elixir package for interacting with the version 2 of the Mangopay API.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mangopay_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:mangopay_ex, "~> 0.1.0"}]
end
```

## Configuration

```elixir
use Mix.Config

config :mangopay_ex,
  api_base: "https://api.sandbox.mangopay.com/v2.01",
  client_id: System.get_env("MANGOPAY_CLIENT_ID"),
  client_pass: System.get_env("MANGOPAY_CLIENT_PASS")
```

For security reason, use environment variables rather than hard coding your account credentials.

## Usage

```elixir
# Create a wallet
MangopayEx.Wallets.create(%{owners: ["USER_ID"], description: "Main wallet", currency: "EUR"})
{:ok,
 %{balance: %{amount: 0, currency: "EUR"}, creation_date: 1503057903,
   currency: "EUR", description: "Main wallet", funds_type: "DEFAULT", id: "WALLET_ID",
   owners: ["USER_ID"], tag: nil}}
```

## Implementation

- [x] Users
  - [x] Create natural user  `MangopayEx.Users.Natural.create(%{})`
  - [x] Update natural user  `MangopayEx.Users.Natural.update(id, %{})`
  - [x] Create legal user  `MangopayEx.Users.Legal.create(%{})`
  - [x] Update legal user  `MangopayEx.Users.Legal.update(id, %{})`
  - [x] View a user `MangopayEx.Users.view(id)`
  - [x] List a user `MangopayEx.Users.list(id)`
- [x] User emoney
  - [x] view user emoney `MangopayEx.Users.Emoney.view(user_id)`
- [x] Wallets
  - [x] Create  `MangopayEx.Wallets.create(%{})`
  - [x] View    `MangopayEx.Wallets.view(id)`
  - [x] Update  `MangopayEx.Wallets.update(id, %{})`
  - [x] List user wallets `MangopayEx.Users.Wallets.list(user_id)`
- [ ] Payins
- [x] Transfers
  - [x] Create `MangopayEx.Transfers.create(%{})`
  - [x] View `MangopayEx.Transfers.view(id)`
- [x] Payouts
  - [x] Create `MangopayEx.Payouts.create(%{})`
  - [x] View `MangopayEx.Payouts.view(id)`
- [x] KYC Document
  - [x] View `MangopayEx.KycDocuments.view(id)`
  - [x] list `MangopayEx.KycDocuments.list`
  - [x] Create a kyc document for a user `MangopayEx.Users.KycDocuments.create(user_id, %{})`
  - [x] Create a kyc page for a user `MangopayEx.Users.KycDocuments.create(:page, user_id, document_id, %{})`
  - [x] Submit a kyc `MangopayEx.Users.KycDocuments.list(user_id, document_id, %{})`
  - [x] List kyc for a user `MangopayEx.Users.KycDocuments.list(user_id)`
- [ ] Hooks
- [ ] Transactions
  - [x] List user's Transactions `MangopayEx.Users.Transactions.list(user_id)`
  - [x] List wallets's Transactions `MangopayEx.Wallets.Transactions.list(user_id)`
  - [ ] List dispute's Transactions
  - [ ] List Client's Transactions
  - [ ] List Client wallet's Transactions
- [ ] Bank Account
  - [x] View a bank account `MangoPayEx.Users.Bankaccounts.view(user_id, id)`
  - [x] List user bank accounts `MangoPayEx.Users.Bankaccounts.list(user_id)`
