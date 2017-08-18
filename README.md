# MangopayEx

**TODO: Add description**

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
  client_pass: System.get_env("MANGOPAY_CLIENT_PASS)
```
