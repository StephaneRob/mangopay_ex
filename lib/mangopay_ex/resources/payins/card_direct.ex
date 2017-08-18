defmodule MangopayEx.Payins.CardDirect do

  @endpoint "payins/card/direct"
  @resource_name "payin card direct"

  use MangopayEx.Resource, import: [:create]
end
