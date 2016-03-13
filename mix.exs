defmodule ProperCase.Mixfile do
  use Mix.Project

  def project do
    [app: :proper_case,
     version: "0.0.2",
     elixir: "~> 1.2",
     description: description,
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  defp description do
    """
    A helpful plug for Phoenix that converts your incoming parameters to Elixir's preferred `snake_case`

    Use directly as a part of your `router.ex` connection pipeline :)
    """
  end

  defp deps do
    []
  end

  defp package do
    [ 
      files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
      maintainers: ["Johnny Ji"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => "https://github.com/johnnyji/proper_case",
        "Docs" => "https://github.com/johnnyji/proper_case"
      }
    ]
  end 

end
