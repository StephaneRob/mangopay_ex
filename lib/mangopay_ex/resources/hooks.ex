defmodule MangopayEx.Hooks do

  @moduledoc """
  """

  @endpoint "hooks"
  @resource_name "hook"

  use MangopayEx.Resource, import: [:create, :view, :list, :update]

end
