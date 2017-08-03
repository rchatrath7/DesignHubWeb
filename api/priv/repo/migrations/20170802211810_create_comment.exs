defmodule Pittdesignhub.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :author, :string
      add :resolved, :boolean, default: false, null: false
      add :comment, :string
      add :parent_id, :integer
      add :parent, references(:comments, on_delete: :nothing)

      timestamps()
    end
    create index(:comments, [:parent])

  end
end
