defmodule HackerNewsNotifier do
    require HTTPotion
    require Exquery

    def feed() do
	response = HTTPotion.get "https://news.ycombinator.com/rss"
	if HTTPotion.Response.success?(response) do
	    {:ok, response.body}
	else
	    {:error, nil}
	end
    end
    
    defp secondElement(item), do: elem(item, 1)
    
    defp getTitleElements(feedText) do
	feedText
	|> Exquery.tree
	|> Exquery.Query.all({:tag, "title", []})
    end

    def extractTitles({:ok, feedText}) do
	feedText
	|> getTitleElements
	|> Enum.flat_map(fn(item) -> secondElement(item) end)
	|> Enum.map(fn(item) -> secondElement(item) end)
    end

    def extractTitles({:error, _}), do: []
end
