defmodule MangopayEx.Transfers do

  @endpoint "transfers"
  @resource_name "transfer"

  use MangopayEx.Resource, import: [:create, :view]

end
