defmodule MangopayEx.Users.KycDocuments do
  @moduledoc """
  """

  @endpoint "users"

  use MangopayEx.Resource

  @doc "List kyc documents for a given user"
  def list(user_id) do
    Api.member(__MODULE__, :list, user_id,  "kyc/documents")
  end

  @doc "Create a kyc documents for a given user"
  def create(:page, user_id, document_id, data) do
    Api.member(__MODULE__, :create, user_id,  "kyc/documents/#{document_id}/pages", data)
  end

  @doc "Create a kyc documents for a given user"
  def create(user_id, data) do
    Api.member(__MODULE__, :create, user_id,  "kyc/documents", data)
  end

  @doc "Create a kyc documents for a given user"
  def update(user_id, document_id, data) do
    Api.member(__MODULE__, :update, user_id,  "kyc/documents/#{document_id}", data)
  end

end
