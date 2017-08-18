defmodule MangopayEx.Users.Transactions do
  @moduledoc """
  """

  @endpoint "users"

  use MangopayEx.Resource

  @doc "List all transactions for a given user"
  def list(user_id) do
    Api.member(__MODULE__, :list, user_id,  "transactions")
  end

end
