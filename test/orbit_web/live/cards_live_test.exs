defmodule OrbitWeb.CardsLiveTest do
  use OrbitWeb.ConnCase

  import Phoenix.LiveViewTest
  import Orbit.BoardsFixtures

  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
  @invalid_attrs %{title: nil}

  defp create_cards(_) do
    cards = cards_fixture()
    %{cards: cards}
  end

  describe "Index" do
    setup [:create_cards]

    test "lists all cards", %{conn: conn, cards: cards} do
      {:ok, _index_live, html} = live(conn, Routes.cards_index_path(conn, :index))

      assert html =~ "Listing Cards"
      assert html =~ cards.title
    end

    test "saves new cards", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.cards_index_path(conn, :index))

      assert index_live |> element("a", "New Cards") |> render_click() =~
               "New Cards"

      assert_patch(index_live, Routes.cards_index_path(conn, :new))

      assert index_live
             |> form("#cards-form", cards: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#cards-form", cards: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.cards_index_path(conn, :index))

      assert html =~ "Cards created successfully"
      assert html =~ "some title"
    end

    test "updates cards in listing", %{conn: conn, cards: cards} do
      {:ok, index_live, _html} = live(conn, Routes.cards_index_path(conn, :index))

      assert index_live |> element("#cards-#{cards.id} a", "Edit") |> render_click() =~
               "Edit Cards"

      assert_patch(index_live, Routes.cards_index_path(conn, :edit, cards))

      assert index_live
             |> form("#cards-form", cards: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#cards-form", cards: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.cards_index_path(conn, :index))

      assert html =~ "Cards updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes cards in listing", %{conn: conn, cards: cards} do
      {:ok, index_live, _html} = live(conn, Routes.cards_index_path(conn, :index))

      assert index_live |> element("#cards-#{cards.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#cards-#{cards.id}")
    end
  end

  describe "Show" do
    setup [:create_cards]

    test "displays cards", %{conn: conn, cards: cards} do
      {:ok, _show_live, html} = live(conn, Routes.cards_show_path(conn, :show, cards))

      assert html =~ "Show Cards"
      assert html =~ cards.title
    end

    test "updates cards within modal", %{conn: conn, cards: cards} do
      {:ok, show_live, _html} = live(conn, Routes.cards_show_path(conn, :show, cards))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Cards"

      assert_patch(show_live, Routes.cards_show_path(conn, :edit, cards))

      assert show_live
             |> form("#cards-form", cards: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#cards-form", cards: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.cards_show_path(conn, :show, cards))

      assert html =~ "Cards updated successfully"
      assert html =~ "some updated title"
    end
  end
end
