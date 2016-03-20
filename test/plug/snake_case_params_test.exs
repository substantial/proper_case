defmodule ProperCase.Plug.SnakeCaseParamsTest do
  use ExUnit.Case
  alias ProperCase.Plug.SnakeCaseParams
  
  test ".snake_case_params converts map keys to `snake_case`" do
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
          %{"name" => "Luke", "weaponOfChoice" => "lightsaber"},
          %{"name" => "Chewie", "weaponOfChoice" => "bowcaster"},
          %{"name" => "Leia", "weaponOfChoice" => "blaster"}
        ] 
      }
    } 
    assert SnakeCaseParams.snake_case_params(incoming_params) === expected_params
  end
end
