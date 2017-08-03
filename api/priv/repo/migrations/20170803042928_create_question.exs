defmodule Pittdesignhub.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :description, :string
      add :response, :string

      add :charter_id, references(:charters, on_delete: :nothing)

      timestamps()
    end
    create index(:questions, [:charter_id])

  end
end
