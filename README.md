# ProperCase

A helpful plug that converts your incoming parameters to
 Elixir's `snake_case`

 Plug it into your `router.ex` connection pipeline like so:

```elixir
  pipeline :api do
    plug :accepts, ["json"]
    plug ProperCase
  end
```


### Before:

```elixir
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
```

### After: 

```elixir
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

Enjoy :)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add proper_case to your list of dependencies in `mix.exs`:

        def deps do
          [{:proper_case, "~> 0.0.1"}]
        end

  2. Ensure proper_case is started before your application:

        def application do
          [applications: [:proper_case]]
        end

