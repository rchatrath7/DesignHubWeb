defmodule Pittdesignhub.Repo.Migrations.CreateManager do
  use Ecto.Migration

  def change do
    create table(:managers) do
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:managers, [:user_id])

  end
end
