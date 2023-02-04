defmodule OrbitWeb.BoardLive.Show do
  use OrbitWeb, :live_view

  alias Orbit.Boards

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"board_id" => board_id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:board, Boards.get_board!(board_id))
     |> assign(:columns, Boards.list_columns(board_id))}
  end

  defp page_title(:show), do: "Show Board"
  defp page_title(:edit), do: "Edit Board"
end
