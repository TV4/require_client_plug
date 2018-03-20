defmodule RequireClientPlug.MixProject do
  use Mix.Project

  def project do
    [
      app: :require_client_plug,
      version: "1.0.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:plug, "~> 1.1"},
      {:poison, ">= 1.0.0"},
      {:mix_test_watch, "~> 0.5", only: :dev, runtime: false}
    ]
  end
end
