defmodule Pittdesignhub.Repo.Migrations.CreateDesigner do
  use Ecto.Migration

  def change do
    create table(:designers) do
      add :class, :string
      add :graduation_year, :integer
      add :major, :string
      add :minor, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:designers, [:user_id])

  end
end
