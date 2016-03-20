defmodule ProperCase do

  import String, only: [first: 1, replace: 4, downcase: 1, upcase: 1]

  @doc """
  Converts all the keys in a map to `camelCase`
  """
  def to_camel_case(map) when is_map(map) do
    for {key, val} <- map,
      into: %{},
      do: {camel_case_key(key), to_camel_case(val)}
  end

  def to_camel_case(list) when is_list(list) do
    list
    |> Enum.map(&to_camel_case/1)
  end

  def to_camel_case(final_val), do: final_val

  @doc """
  Converts an atom to a `camelCase` string 
  """
  def camel_case_key(key) when is_atom(key) do
    key
    |> Atom.to_string
    |> camel_case_key
  end

  @doc """
  Converts a string to `camelCase`
  """
  def camel_case_key(key) when is_binary(key) do
    first_char = key |> first
    key
    |> Mix.Utils.camelize
    |> replace(upcase(first_char), downcase(first_char), global: false)
  end

end
