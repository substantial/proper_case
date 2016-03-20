# ProperCase

An Elixir library that converts keys in maps between `snake_case` and `camel_case`.

Useful as a plug in Phoenix for converting incoming params from JavaScript's `camelCase` to Elixir's `snake_case`

Converts all keys in  maps to snake case
`ProperCase.to_snake_case/1`

Converts all keys in maps to camel case
`ProperCase.to_camel_case/1`

Converts a string to snake case
`ProperCase.snake_case/1`

Converts a string to camel case
`ProperCase.camel_case/1`


### Example: `ProperCase.to_snake_case`
```elixir
# Before:
%{"user" => %{
    "firstName" => "Han",
    "lastName" => "Solo",
    "alliesInCombat" => [
      %{"name" => "Luke", "weaponOfChoice" => "lightsaber"},
      %{"name" => "Chewie", "weaponOfChoice" => "bowcaster"},
      %{"name" => "Leia", "weaponOfChoice" => "blaster"}
    ] 
  }
} 

# After
%{"user" => %{
    "first_name" => "Han",
    "last_name" => "Solo",
    "allies_in_combat" => [
      %{"name" => "Luke", "weapon_of_choice" => "lightsaber"},
      %{"name" => "Chewie", "weapon_of_choice" => "bowcaster"},
      %{"name" => "Leia", "weapon_of_choice" => "blaster"}
    ]
  }
}
```


### Using as a plug in Phoenix

`ProperCase` is extremely useful as a part of your connection pipeline, converting incoming params from
JavaScript's `camelCase` to Elixir's `snake_case`

Plug it into your `router.ex` connection pipeline like so:

```elixir
  pipeline :api do
    plug :accepts, ["json"]
    plug ProperCase.Plug.SnakeCaseParams
  end
```



## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add proper_case to your list of dependencies in `mix.exs`:

        def deps do
          [{:proper_case, "~> 0.1.0"}]
        end

  2. Ensure proper_case is started before your application:

        def application do
          [applications: [:proper_case]]
        end

