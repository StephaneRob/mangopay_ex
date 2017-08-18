defmodule MangopayEx.Api do
  @api_base Application.fetch_env!(:mangopay_ex, :api_base)
  @client_id Application.fetch_env!(:mangopay_ex, :client_id)
  @auth_endpoint "oauth/token"
  use HTTPoison.Base

  def auth do
    {_, resp} = post(auth_url(),
      "grant_type=" <> URI.encode_www_form("client_credentials"),
      auth_header(:auth))
    resp |> decode_json()
  end

  defp auth_url do
    "#{@api_base}/#{@auth_endpoint}/"
  end

  def list(module, id \\ nil, action \\ nil) do
    {_, resp} = get(build_url(module, id, action), auth_header())
    resp |> decode_json(:list)
  end

  def view(module, id \\ nil, action \\ nil) do
    {_, resp} = get(build_url(module, id, action), auth_header())
    resp |> decode_json()
  end

  def create(module, data, id \\ nil, action \\ nil) do
    {_, resp} = post(build_url(module, id, action), encode_json(data), auth_header())
    resp |> decode_json()
  end

  def update(module, id, data) do
    {_, resp} = put(build_url(module, id), encode_json(data), auth_header())
    resp |> decode_json()
  end

  def member(module, method, id, action) when method in [:list, :view] do
    apply(__MODULE__, method, [module, id, action])
  end
  def member(module, :create, id, action, data), do: create(module, data, id, action)

  def build_url(module, id \\ nil, member_action \\ nil) do
    url = "#{@api_base}/#{@client_id}/#{module.endpoint}"
    if id do
      url = url <> "/#{id}"
    end
    if member_action do
      url = url <> "/#{member_action}"
    end
    url
  end

  defp auth_header(:auth) do
    [
      "Authorization": "Basic #{MangopayEx.Client.auth_token}",
      "Content-Type": "application/x-www-form-urlencoded"
    ]
  end

  defp auth_header do
    [
      "Authorization": "Bearer #{MangopayEx.Client.get_token}",
      "Content-Type": "application/json"
    ]
  end

  def decode_json(resp_map, :list) do
    case resp_map.status_code do
      200 ->
        snake_cases = Enum.reduce(Poison.decode!(resp_map.body), [], fn(item, acc) ->
          snake_case = snake_case_map(item)
          List.insert_at(acc, -1, snake_case)
        end)
        {:ok, snake_cases}
      x when x > 200 ->
        errors = Poison.decode!(resp_map.body)["errors"] |> snake_case_map
        {:error, errors}
    end
  end

  def decode_json(resp_map) do
    case resp_map.status_code do
      200 ->
        snake_case = Poison.decode!(resp_map.body) |> snake_case_map
        {:ok, snake_case}
      x when x > 200 ->
        errors = Poison.decode!(resp_map.body)["errors"] |> snake_case_map
        {:error, errors}
    end
  end

  def encode_json(data) do
    Poison.encode!(camel_case_map(data))
  end

  defp snake_case_map(map) do
    map
    |> Enum.reduce(%{}, fn({x, y}, acc) ->
      snake_case({x, y}, acc) end)
  end
  defp snake_case({key, val}, acc) do
    key = key |> Macro.underscore |> to_atom

    if is_map(val) do
      val =  snake_case_map(val)
    end
    Map.put(acc, key, val)
  end

  defp camel_case_map(map) do
    map
    |> Enum.reduce(%{}, fn({x, y}, acc) ->
      camel_case({x, y}, acc) end)
  end
  defp camel_case({key, val}, acc) do
    key = key |> Atom.to_string |> Macro.camelize |> to_atom

    if is_map(val) do
      val =  camel_case_map(val)
    end
    Map.put(acc, key, val)
  end

  defp to_atom(string) do
    try do
      String.to_existing_atom(string)
    rescue
      ArgumentError -> String.to_atom(string)
    end
  end
end
