use Mix.Config

config :mangopay_ex,
  api_base: "https://api.sandbox.mangopay.com/v2.01",
  client_id: System.get_env("MANGOPAY_CLIENT_ID"),
  client_pass: System.get_env("MANGOPAY_CLIENT_PASS")
