defmodule MangopayEx.Users.Wallets do
  @moduledoc """
  """

  @endpoint "users"

  use MangopayEx.Resource

  @doc "List all wallets for a given user"
  def list(user_id) do
    Api.member(__MODULE__, :list, user_id,  "wallets")
  end

end
