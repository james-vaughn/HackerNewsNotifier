defmodule HackerNewsNotifier do
    
    use Application

    alias HackerNewsNotifier.Feed
    alias HackerNewsNotifier.Notify

    def start(_type, _args) do
	run([])
    end

   def run(oldList) do
	IO.puts "Hitting RSS feed"
	getTitleList
	|> runHelper(oldList)
   end

    defp runHelper(newList, oldList) do
	Notify.notifyAllNewArticles(newList, oldList)
	:timer.sleep(300000)
	run(newList)
    end

    defp getTitleList() do
	Feed.getFeed
	|> Feed.extractTitles
    end

end
