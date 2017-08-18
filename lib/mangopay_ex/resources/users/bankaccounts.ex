defmodule MangopayEx.Users.Bankaccounts do
  @moduledoc """
  """

  @endpoint "users"

  use MangopayEx.Resource

  @doc "List bankaccounts for a given user"
  def list(user_id) do
    Api.member(__MODULE__, :list, user_id,  "bankaccounts")
  end

  @doc "View a bankaccount for a given user"
  def view(user_id, bankaccount_id) do
    Api.member(__MODULE__, :view, user_id,  "bankaccounts/#{bankaccount_id}")
  end

end
