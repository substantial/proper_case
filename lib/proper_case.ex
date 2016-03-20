defmodule ProperCase do
  @moduledoc """
  An Elixir library that converts keys in maps between `snake_case` and `camel_case`
  """

  import String, only: [first: 1, replace: 4, downcase: 1, upcase: 1]

  @doc """
  Converts all the keys in a map to `camelCase`
  """
  def to_camel_case(map) when is_map(map) do
    for {key, val} <- map,
      into: %{},
      do: {camel_case(key), to_camel_case(val)}
  end

  def to_camel_case(list) when is_list(list) do
    list
    |> Enum.map(&to_camel_case/1)
  end

  def to_camel_case(final_val), do: final_val

  @doc """
  Converts all the keys in a map to `snake_case`
  """
  def to_snake_case(map) when is_map(map) do
    for {key, val} <- map,
      into: %{},
      do: {snake_case(key), to_snake_case(val)}
  end

  def to_snake_case(list) when is_list(list) do
    list
    |> Enum.map(&to_snake_case/1)
  end

  def to_snake_case(other_types), do: other_types 

  
  
  @doc """
  Converts an atom to a `camelCase` string 
  """
  def camel_case(key) when is_atom(key) do
    key
    |> Atom.to_string
    |> camel_case
  end

  @doc """
  Converts a string to `camelCase`
  """
  def camel_case(key) when is_binary(key) do
    first_char = key |> first
    key
    |> Mix.Utils.camelize
    |> replace(upcase(first_char), downcase(first_char), global: false)
  end

  @doc """
  Converts an to `snake_case` string`
  """
  def snake_case(val) when is_atom(val) do
    val
    |> Atom.to_string
    |> Mix.Utils.underscore 
  end

  @doc """
  Converts a string to `snake_case`
  """
  def snake_case(val) do
    val |> Mix.Utils.underscore
  end


end
