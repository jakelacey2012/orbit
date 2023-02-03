defmodule OrbitWeb.CardsLive.FormComponent do
  use OrbitWeb, :live_component

  alias Orbit.Boards

  @impl true
  def update(%{cards: cards} = assigns, socket) do
    changeset = Boards.change_cards(cards)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"cards" => cards_params}, socket) do
    changeset =
      socket.assigns.cards
      |> Boards.change_cards(cards_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"cards" => cards_params}, socket) do
    save_cards(socket, socket.assigns.action, cards_params)
  end

  defp save_cards(socket, :edit, cards_params) do
    case Boards.update_cards(socket.assigns.cards, cards_params) do
      {:ok, _cards} ->
        {:noreply,
         socket
         |> put_flash(:info, "Cards updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_cards(socket, :new, cards_params) do
    case Boards.create_cards(cards_params) do
      {:ok, _cards} ->
        {:noreply,
         socket
         |> put_flash(:info, "Cards created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
