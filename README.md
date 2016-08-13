# HackerNewsNotifier

Application which pushes notifications to desktop about new hackerNews articles

## Installation

  1. Add hacker_news_notifier to your list of dependencies in mix.exs:

        def deps do
          [{:hacker_news_notifier, "~> 0.0.1"}]
        end

  2. Ensure hacker_news_notifier is started before your application:

        def application do
          [applications: [:hacker_news_notifier]]
        end
