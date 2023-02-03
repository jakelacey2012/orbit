defmodule OrbitWeb.CardsLive.Show do
  use OrbitWeb, :live_view

  alias Orbit.Boards

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:cards, Boards.get_cards!(id))}
  end

  defp page_title(:show), do: "Show Cards"
  defp page_title(:edit), do: "Edit Cards"
end