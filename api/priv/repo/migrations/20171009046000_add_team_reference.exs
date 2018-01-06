defmodule Pittdesignhub.Repo.Migrations.AddTeamReferences do
  use Ecto.Migration

  def change do
    alter table(:charters) do
      add :team_id, references(:teams, on_delete: :nothing)
    end
    create index(:charters, [:team_id])

  end
end
