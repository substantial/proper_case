defmodule ProperCase do
  @moduledoc """
   A helpful plug that converts your incoming parameters to
   Elixir's `snake_case`

   Plug it into your `router.ex` connection pipeline like so:

    pipeline :api do
      plug :accepts, ["json"]
      plug ProperCase
    end

  Enjoy :)
   """ 
   
  def init(opts), do: opts

  def call(%{params: params} = conn, _opts) do
    %{conn | params: snake_case_params(params)}
  end

  def snake_case_params(%{} = params) do
    for {key, val} <- params,
      into: %{},
      do: {snake_case(key), snake_case_params(val)}
  end

  def snake_case_params(other_types), do: other_types 

  defp snake_case(val) when is_atom(val) do
    val
    |> Atom.to_string
    |> Mix.Utils.underscore 
  end

  defp snake_case(val) do
    val |> Mix.Utils.underscore
  end

end