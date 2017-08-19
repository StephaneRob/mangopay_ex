defmodule MangopayEx.KycDocuments do

  @endpoint "kyc/documents"
  @resource_name "kyc document"

  use MangopayEx.Resource, import: [:list, :view]

end
