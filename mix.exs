defmodule KinoD3.MixProject do
  use Mix.Project

  def project do
    [
      app: :kino_d3,
      version: "0.1.0",
      elixir: "~> 1.13.4",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Kino.SmartCell.D3.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:kino, "~> 0.6.2"}
    ]
  end
end
