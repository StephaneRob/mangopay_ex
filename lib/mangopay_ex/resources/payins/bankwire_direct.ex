defmodule MangopayEx.Payins.BankwireDirect do

  @endpoint "payins/bankwire/direct"
  @resource_name "payin bank wire direct"

  use MangopayEx.Resource, import: [:create]
end
