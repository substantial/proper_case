defmodule ProperCaseTest do
  use ExUnit.Case
  doctest ProperCase
  
  test ".snake_case_params converts map keys to `camelCase`" do
    expected_params = %{"user" => %{
        "first_name" => "Han",
        "last_name" => "Solo",
        "allies_in_combat" => [
          %{"name" => "Luke", "weapon_of_choice" => "lightsaber"},
          %{"name" => "Chewie", "weapon_of_choice" => "bowcaster"},
          %{"name" => "Leia", "weapon_of_choice" => "blaster"}
        ]
      }
    }
    incoming_params = %{"user" => %{
        "firstName" => "Han",
        "lastName" => "Solo",
        "alliesInCombat" => [
          %{"name" => "Luke", "weapon_of_choice" => "lightsaber"},
          %{"name" => "Chewie", "weapon_of_choice" => "bowcaster"},
          %{"name" => "Leia", "weapon_of_choice" => "blaster"}
        ] 
      }
    } 
    assert ProperCase.snake_case_params(incoming_params) === expected_params
  end
end
