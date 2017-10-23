defmodule Mangoex.Mixfile do
  use Mix.Project

  def project do
    [app: :mangoex,
     version: "0.2.2",
     description: "Elixir wrapper for the MangoPay API",
     package: package(),
     elixir: "~> 1.5",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger,
                    :httpotion],
     mod: {Mangoex, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpotion, "~> 3.0.2"},
      {:poison, "~> 3.0"},
      {:exvcr, "~> 0.7", only: :test},
      {:dialyxir, "~> 0.4", only: [:dev]},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["overture8", "tosbourn"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/overture8/mangoex"}
    ]
  end
end
