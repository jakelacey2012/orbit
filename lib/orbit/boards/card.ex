defmodule Orbit.Boards.Card do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "cards" do
    field :title, :string

    #    field :board_id, :binary_id
    belongs_to :board, Orbit.Boards.Board
    #    field :column_id, :binary_id
    belongs_to :column, Orbit.Boards.Card

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:title, :board_id, :column_id])
    |> validate_required([:title])
  end
end
