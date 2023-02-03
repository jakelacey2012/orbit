defmodule OrbitWeb.ColumnLive.Show do
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
     |> assign(:column, Boards.get_column!(id))}
  end

  defp page_title(:show), do: "Show Column"
  defp page_title(:edit), do: "Edit Column"
end
