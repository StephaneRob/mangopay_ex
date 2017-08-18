defmodule MangopayEx.Users.Legal do
  @moduledoc """
  A Legal User represents a business or an organization whereas a natural user is a person.
  """

  @endpoint "users/legal"
  @resource_name "legal user"

  use MangopayEx.Resource, import: [:create, :update]

end
