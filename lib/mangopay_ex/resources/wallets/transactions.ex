defmodule MangopayEx.Wallets.Transactions do
  @moduledoc """
  """

  @endpoint "wallets"

  use MangopayEx.Resource

  @doc "List all transactions for a given user"
  def list(wallet_id) do
    Api.member(__MODULE__, :list, wallet_id,  "transactions")
  end

end
