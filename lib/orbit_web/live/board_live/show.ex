defmodule OrbitWeb.BoardLive.Show do
  use OrbitWeb, :live_view

  alias Orbit.Boards
  alias Orbit.Boards.Column
  alias Orbit.Boards.Card

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"board_id" => board_id} = params, _url, socket) do
    {:noreply,
      socket
      |> assign(:page_title, page_title(socket.assigns.live_action))
      |> assign(:board, Boards.get_board!(board_id))
      |> assign(:columns, Boards.list_columns(board_id))
      |> apply_action(socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new_card, %{"column_id" => id}) do
    socket
    |> assign(:card, %Card{})
    |> assign(:column, Boards.get_column!(id))
  end

  # Columns
  defp apply_action(socket, :new_column, _params) do
    socket
    |> assign(:column, %Column{})
    |> assign(:card, %Card{})
  end

  defp apply_action(socket, :edit_column, %{"column_id" => id}) do
    socket
    |> assign(:card, %Card{})
    |> assign(:column, Boards.get_column!(id))
  end

  defp apply_action(socket, _, _) do
    socket
    |> assign(:column, %Column{})
    |> assign(:card, %Card{})
  end


  defp page_title(:show), do: "Show Board"
  defp page_title(:edit), do: "Edit Board"
  defp page_title(:new_column), do: "New Column"
  defp page_title(:edit_column), do: "Edit Column"
  defp page_title(:new_card), do: "New Card"

end
