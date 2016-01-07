defmodule <%= project_name_camelize %>.Mixfile do
  use Mix.Project

  def project do
    [app: :<%= project_name %>,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :wok]]
  end

  defp deps do
    [
      {:wok, ~r/.*/, git: "https://github.com/botsunit/wok.git", branch: "master"},
      {:wok_message_handler, ~r/.*/, git: "https://github.com/botsunit/wok_message_handler.git", branch: "master"}
    ]
  end
end
