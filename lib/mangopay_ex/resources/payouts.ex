defmodule MangopayEx.Payouts do

  @endpoint "payouts"
  @resource_name "payout"

  use MangopayEx.Resource, import: [:view]

  def create(data) do
    Api.member(__MODULE__, :create, nil,  "bankwire", data)
  end

end
