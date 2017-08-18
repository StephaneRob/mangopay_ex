defmodule MangopayEx.Users.Natural do
  @moduledoc """
  A Natural User is a person whereas a legal user represents a business or an organisation. This natural user is able to:
  """

  @endpoint "users/natural"
  @resource_name "natural user"

  use MangopayEx.Resource, import: [:create, :update]

end
