defmodule ExTwiml.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_twiml,
      description: "Generate TwiML with Elixir",
      version: "2.3.4-podium",
      elixir: "~> 1.15",
      deps: deps(),
      aliases: aliases(),
      dialyzer: [
        plt_add_apps: [:ex_unit, :mix],
        ignore_warnings: ".dialyzer.ignore-warnings",
        list_unused_filters: true,
        plt_local_path: System.get_env("PLT_LOCAL_PATH")
      ],
      package: package(),
      test_coverage: [summary: [threshold: 80]]
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [extra_applications: [:logger]]
  end

  def cli do
    [
      preferred_envs: [precommit: :test]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.38", only: [:dev, :docs]}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "CHANGELOG.md", "LICENSE"],
      maintainers: ["Podium"],
      licenses: ["MIT"],
      links: %{
        "Github" => "https://github.com/podium/ex_twiml"
      }
    ]
  end

  defp aliases() do
    [
      precommit: [
        "compile --warnings-as-errors",
        "deps.unlock --unused",
        "format",
        "dialyzer",
        "credo --strict",
        "test --cover"
      ]
    ]
  end
end
