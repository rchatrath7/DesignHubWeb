defmodule Pittdesignhub.Repo.Migrations.CreateTeam do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :is_active, :boolean, default: false, null: false
      add :manager_id, references(:managers, on_delete: :nothing)

      timestamps()
    end
    create index(:teams, [:manager_id])

  end
end
