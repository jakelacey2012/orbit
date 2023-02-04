defmodule Orbit.Boards.Column do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "columns" do
    field :name, :string

    #    field :board_id, :binary_id
    belongs_to :board, Orbit.Boards.Board
    has_many :cards, Orbit.Boards.Card

    timestamps()
  end

  @doc false
  def changeset(column, attrs) do
    column
    |> cast(attrs, [:name, :board_id])
    |> validate_required([:name])
  end
end
