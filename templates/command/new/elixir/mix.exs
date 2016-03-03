defmodule <%= bot_name_camelize %>.Mixfile do
  use Mix.Project

  def project do
    [app: :<%= bot_name %>,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: Mix.compilers ++ [:erlydtl],
     erlydtl_options: [
       source: "templates",
       ext: :tmpl,
       suffix: "_tmpl",
       compiler_options: [
         {:libraries, [{:wok_helpers, :wok_helpers_dtl}]},
         {:default_libraries, [:wok_helpers]},
         :report_warnings,
         :report_errors
       ]
     ],
     deps: deps]
  end

  def application do
    [applications: [:logger, :wok]]
  end

  defp deps do
    [
      {:wok, ~r/.*/, git: "git@gitlab.botsunit.com:msaas/wok.git", branch: "master"},
      {:wok_erlang_templates, ~r/.*/, git: "git@gitlab.botsunit.com:msaas/wok_erlang_templates.git", branch: "master"}
    ]
  end
end
