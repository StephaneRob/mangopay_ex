defmodule MangopayEx.Wallets do
  @moduledoc """
  """

  @endpoint "wallets"
  @resource_name "wallet"

  @type wallet_type :: %{
    id: String.t,
    creationdate: Integer.t,
    tag: String.t,
    owners: [String.t],
    balance: %{
      currency: String.t,
      amount: Integer.t
    },
    fundstype: String.t,
    description: String.t,
    currency: String.t
  }

  @spec create(%{owners: [String.t], description: String.t, currency: String.t}) :: {Atom.t, wallet_type}
  @spec update(Integer.t, %{tag: String.t, description: String.t}) :: {Atom.t, wallet_type}
  @spec view(Integer.t) :: {Atom.t, wallet_type}

  use MangopayEx.Resource, import: [:create, :update, :view]

end
