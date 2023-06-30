defmodule OrganizationWeb.Notebook do
  use OrganizationWeb, :live_component

  attr :expanded, :any

  slot :page do
    attr :tab, :string
  end

  def render(assigns) do
    ~H"""
    <div>
      <.tabs tabs={@tabs} expanded={@expanded} target={@myself} />
      <.page :for={page <- @page} tab={page[:tab]} expanded={@expanded} inner_block={page} />
    </div>
    """
  end

  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end

  def handle_event("expand", %{"tab" => tab}, socket) do
    {:noreply, assign(socket, :expanded, tab)}
  end

  attr :tabs, :list, default: []
  attr :expanded, :string, default: nil
  attr :target, :any

  def tabs(assigns) do
    ~H"""
    <ul class="flex flex-wrap">
      <li :for={tab <- @tabs} class="mr-8">
        <button
          class={button_class(@expanded == tab)}
          phx-click="expand"
          phx-value-tab={tab}
          phx-target={@target}
        >
          <%= tab %>
        </button>
      </li>
    </ul>
    """
  end

  attr :expanded, :boolean
  attr :tab, :string

  slot :inner_block

  def page(assigns) do
    ~H"""
    <div :if={@expanded == @tab} class="bg-slate-100 p-6">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  defp button_class(expanded) do
    "bg-slate-#{bshade(expanded)} hover:bg-slate-50 text-slate-700 font-bold p-2"
  end

  defp bshade(true), do: 100
  defp bshade(false), do: 300
end
