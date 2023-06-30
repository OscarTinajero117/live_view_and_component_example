# Tabs.NotebookFunction
defmodule OrganizationWeb.DashLive do
  use OrganizationWeb, :live_view
  import OrganizationWeb.WordComponent

  def mount(%{"word" => word}, _session, socket) do
    {:ok, assign(socket, :word, word)}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-2xl my-8">The World of the Word
      <span class="bg-slate-200 text-3xl"> <%= @word %> </span>
    </h1>
    <.wordbook word={@word} />
    """
  end
end
