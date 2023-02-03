defmodule OrbitWeb.CardsLive.Index do
  use OrbitWeb, :live_view

  alias Orbit.Boards
  alias Orbit.Boards.Cards

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :cards_collection, list_cards())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Cards")
    |> assign(:cards, Boards.get_cards!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Cards")
    |> assign(:cards, %Cards{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Cards")
    |> assign(:cards, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    cards = Boards.get_cards!(id)
    {:ok, _} = Boards.delete_cards(cards)

    {:noreply, assign(socket, :cards_collection, list_cards())}
  end

  defp list_cards do
    Boards.list_cards()
  end
end
