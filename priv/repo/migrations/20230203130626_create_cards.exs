defmodule Orbit.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :board_id, references(:boards, on_delete: :nothing, type: :binary_id)
      add :column_id, references(:columns, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:cards, [:board_id])
    create index(:cards, [:column_id])
  end
end
