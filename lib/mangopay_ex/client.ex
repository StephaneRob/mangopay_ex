defmodule MangopayEx.Client do
  @client_id Application.fetch_env!(:mangopay_ex, :client_id)
  @client_pass Application.fetch_env!(:mangopay_ex, :client_pass)

  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def stop do
    Agent.stop(__MODULE__)
  end

  def get_token do
    state = Agent.get(__MODULE__, fn(x) -> x end)
    new_state = cond do
      state[:token] == nil || state[:timestamp] == nil || state[:timestamp] < DateTime.to_unix(DateTime.utc_now) ->
        auth(state)
      true ->
        state
    end

    Agent.update(__MODULE__, fn(_state) -> new_state end)

    new_state[:token]
  end

  def auth_token do
    :base64.encode_to_string("#{@client_id}:#{@client_pass}")
  end

  defp auth(state) do
    resp = MangopayEx.Auth.auth
     case resp do
       {:ok, auth} ->
         new_state = state
         |> Map.put(:token, auth.access_token)
         |> Map.put(:timestamp, DateTime.to_unix(DateTime.utc_now) + auth.expires_in)

         new_state
       {:error, _body} ->
         state
     end
  end
end
