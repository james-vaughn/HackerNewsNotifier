defmodule HackerNewsNotifier.Mixfile do
  
  use Mix.Project

  def project do
    [app: :hacker_news_notifier,
     version: "0.0.1",
     elixir: "~> 1.1-dev",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  # Type `mix help compile.app` for more information
  def application do
    [
	applications: [:logger, :httpotion, :exquery],
    	mod: {HackerNewsNotifier, [] }
    ]
  end

  defp deps do
    [
	{:httpotion, "~> 3.0.0"},
	{:exquery, "~> 0.0.11"}
    ]
  end
end
