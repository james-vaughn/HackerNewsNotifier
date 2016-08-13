defmodule HackerNewsNotifier.Notify do

    defp createNotification(title), do: System.cmd("notify-send", ["Hacker News Update", title])

    defp diffTitlesLists([], _), do: []
    defp diffTitlesLists(_, []), do: []
    defp diffTitlesLists(newList, oldList), do: newList -- oldList

    def notifyAllNewArticles(newList, oldList) do
	diffTitlesLists(newList, oldList)
	|> Enum.each(fn(item) -> createNotification(item) end)
    end

end
