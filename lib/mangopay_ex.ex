defmodule MangopayEx do
  @moduledoc """
  Elixir wrapper for Mangopay api
  """

  use Application

  @doc false
  def start(_type, _args) do
    MangopayEx.Supervisor.start_link
  end
end
