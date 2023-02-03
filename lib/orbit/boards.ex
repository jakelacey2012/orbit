defmodule Orbit.Boards do
  @moduledoc """
  The Boards context.
  """

  import Ecto.Query, warn: false
  alias Orbit.Repo

  alias Orbit.Boards.Board

  @doc """
  Returns the list of boards.

  ## Examples

      iex> list_boards()
      [%Board{}, ...]

  """
  def list_boards do
    Repo.all(Board)
  end

  @doc """
  Gets a single board.

  Raises `Ecto.NoResultsError` if the Board does not exist.

  ## Examples

      iex> get_board!(123)
      %Board{}

      iex> get_board!(456)
      ** (Ecto.NoResultsError)

  """
  def get_board!(id), do: Repo.get!(Board, id)

  @doc """
  Creates a board.

  ## Examples

      iex> create_board(%{field: value})
      {:ok, %Board{}}

      iex> create_board(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_board(attrs \\ %{}) do
    %Board{}
    |> Board.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a board.

  ## Examples

      iex> update_board(board, %{field: new_value})
      {:ok, %Board{}}

      iex> update_board(board, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_board(%Board{} = board, attrs) do
    board
    |> Board.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a board.

  ## Examples

      iex> delete_board(board)
      {:ok, %Board{}}

      iex> delete_board(board)
      {:error, %Ecto.Changeset{}}

  """
  def delete_board(%Board{} = board) do
    Repo.delete(board)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking board changes.

  ## Examples

      iex> change_board(board)
      %Ecto.Changeset{data: %Board{}}

  """
  def change_board(%Board{} = board, attrs \\ %{}) do
    Board.changeset(board, attrs)
  end

  alias Orbit.Boards.Column

  @doc """
  Returns the list of columns.

  ## Examples

      iex> list_columns()
      [%Column{}, ...]

  """
  def list_columns do
    Repo.all(Column)
  end

  @doc """
  Gets a single column.

  Raises `Ecto.NoResultsError` if the Column does not exist.

  ## Examples

      iex> get_column!(123)
      %Column{}

      iex> get_column!(456)
      ** (Ecto.NoResultsError)

  """
  def get_column!(id), do: Repo.get!(Column, id)

  @doc """
  Creates a column.

  ## Examples

      iex> create_column(%{field: value})
      {:ok, %Column{}}

      iex> create_column(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_column(attrs \\ %{}) do
    %Column{}
    |> Column.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a column.

  ## Examples

      iex> update_column(column, %{field: new_value})
      {:ok, %Column{}}

      iex> update_column(column, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_column(%Column{} = column, attrs) do
    column
    |> Column.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a column.

  ## Examples

      iex> delete_column(column)
      {:ok, %Column{}}

      iex> delete_column(column)
      {:error, %Ecto.Changeset{}}

  """
  def delete_column(%Column{} = column) do
    Repo.delete(column)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking column changes.

  ## Examples

      iex> change_column(column)
      %Ecto.Changeset{data: %Column{}}

  """
  def change_column(%Column{} = column, attrs \\ %{}) do
    Column.changeset(column, attrs)
  end

  alias Orbit.Boards.Cards

  @doc """
  Returns the list of cards.

  ## Examples

      iex> list_cards()
      [%Cards{}, ...]

  """
  def list_cards do
    Repo.all(Cards)
  end

  @doc """
  Gets a single cards.

  Raises `Ecto.NoResultsError` if the Cards does not exist.

  ## Examples

      iex> get_cards!(123)
      %Cards{}

      iex> get_cards!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cards!(id), do: Repo.get!(Cards, id)

  @doc """
  Creates a cards.

  ## Examples

      iex> create_cards(%{field: value})
      {:ok, %Cards{}}

      iex> create_cards(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cards(attrs \\ %{}) do
    %Cards{}
    |> Cards.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cards.

  ## Examples

      iex> update_cards(cards, %{field: new_value})
      {:ok, %Cards{}}

      iex> update_cards(cards, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cards(%Cards{} = cards, attrs) do
    cards
    |> Cards.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cards.

  ## Examples

      iex> delete_cards(cards)
      {:ok, %Cards{}}

      iex> delete_cards(cards)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cards(%Cards{} = cards) do
    Repo.delete(cards)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cards changes.

  ## Examples

      iex> change_cards(cards)
      %Ecto.Changeset{data: %Cards{}}

  """
  def change_cards(%Cards{} = cards, attrs \\ %{}) do
    Cards.changeset(cards, attrs)
  end
end
