defmodule MangopayEx.Mixfile do
  use Mix.Project

  def project do
    [app: :mangopay_ex,
     version: "0.1.0-alpha.1",
     elixir: "~> 1.5",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "Elixir wrapper for the MangoPay API.",
     package: [
       licenses: ["MIT"],
       links: %{"Github" => "https://github.com/StephaneRob/mangopay_ex"},
       maintainers: ["Stéphane ROBINO"]
       ],
     deps: deps(),

     # Docs
     name: "MangoPayEx",
     source_url: "https://github.com/StephaneRob/mangopay_ex",
     homepage_url: "https://github.com/StephaneRob/mangopay_ex",
     docs: [main: "MangopayEx", # The main page in the docs
            extras: ["README.md"]]]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger], mod: {MangopayEx, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.13.0"},
      {:poison, "~> 3.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
