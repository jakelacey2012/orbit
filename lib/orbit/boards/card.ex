defmodule Orbit.Boards.Card do
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
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
