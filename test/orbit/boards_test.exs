defmodule Orbit.BoardsTest do
  use Orbit.DataCase

  alias Orbit.Boards

  describe "boards" do
    alias Orbit.Boards.Board

    import Orbit.BoardsFixtures

    @invalid_attrs %{name: nil}

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Boards.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Boards.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Board{} = board} = Boards.create_board(valid_attrs)
      assert board.name == "some name"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Board{} = board} = Boards.update_board(board, update_attrs)
      assert board.name == "some updated name"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_board(board, @invalid_attrs)
      assert board == Boards.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Boards.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Boards.change_board(board)
    end
  end

  describe "columns" do
    alias Orbit.Boards.Column

    import Orbit.BoardsFixtures

    @invalid_attrs %{name: nil}

    test "list_columns/0 returns all columns" do
      column = column_fixture()
      assert Boards.list_columns() == [column]
    end

    test "get_column!/1 returns the column with given id" do
      column = column_fixture()
      assert Boards.get_column!(column.id) == column
    end

    test "create_column/1 with valid data creates a column" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Column{} = column} = Boards.create_column(valid_attrs)
      assert column.name == "some name"
    end

    test "create_column/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_column(@invalid_attrs)
    end

    test "update_column/2 with valid data updates the column" do
      column = column_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Column{} = column} = Boards.update_column(column, update_attrs)
      assert column.name == "some updated name"
    end

    test "update_column/2 with invalid data returns error changeset" do
      column = column_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_column(column, @invalid_attrs)
      assert column == Boards.get_column!(column.id)
    end

    test "delete_column/1 deletes the column" do
      column = column_fixture()
      assert {:ok, %Column{}} = Boards.delete_column(column)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_column!(column.id) end
    end

    test "change_column/1 returns a column changeset" do
      column = column_fixture()
      assert %Ecto.Changeset{} = Boards.change_column(column)
    end
  end

  describe "cards" do
    alias Orbit.Boards.Cards

    import Orbit.BoardsFixtures

    @invalid_attrs %{title: nil}

    test "list_cards/0 returns all cards" do
      cards = cards_fixture()
      assert Boards.list_cards() == [cards]
    end

    test "get_cards!/1 returns the cards with given id" do
      cards = cards_fixture()
      assert Boards.get_cards!(cards.id) == cards
    end

    test "create_cards/1 with valid data creates a cards" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Cards{} = cards} = Boards.create_cards(valid_attrs)
      assert cards.title == "some title"
    end

    test "create_cards/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Boards.create_cards(@invalid_attrs)
    end

    test "update_cards/2 with valid data updates the cards" do
      cards = cards_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Cards{} = cards} = Boards.update_cards(cards, update_attrs)
      assert cards.title == "some updated title"
    end

    test "update_cards/2 with invalid data returns error changeset" do
      cards = cards_fixture()
      assert {:error, %Ecto.Changeset{}} = Boards.update_cards(cards, @invalid_attrs)
      assert cards == Boards.get_cards!(cards.id)
    end

    test "delete_cards/1 deletes the cards" do
      cards = cards_fixture()
      assert {:ok, %Cards{}} = Boards.delete_cards(cards)
      assert_raise Ecto.NoResultsError, fn -> Boards.get_cards!(cards.id) end
    end

    test "change_cards/1 returns a cards changeset" do
      cards = cards_fixture()
      assert %Ecto.Changeset{} = Boards.change_cards(cards)
    end
  end
end
