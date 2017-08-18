defmodule MangopayEx.Users do

  @moduledoc """
  A User can be "Natural" or "Legal"
  """

  @endpoint "users"
  @resource_name "user"

  use MangopayEx.Resource, import: [:list, :view]

end
