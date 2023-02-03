defmodule Orbit.Boards.Cards do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "cards" do
    field :title, :string
    field :board_id, :binary_id
    field :column_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(cards, attrs) do
    cards
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
