defmodule MangopayEx.Users.Emoney do
  @moduledoc """
  """

  @endpoint "users"

  use MangopayEx.Resource

  @doc "Show cashout/cashin for a given user"
  def view(user_id) do
    Api.member(__MODULE__, :view, user_id, "emoney")
  end

end
