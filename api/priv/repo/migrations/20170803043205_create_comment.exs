defmodule Pittdesignhub.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :author, :string
      add :resolved, :boolean, default: false, null: false
      add :comment, :string
      add :parent_id, :integer
      
      add :question_id, references(:questions, on_delete: :nothing)
      add :parent, references(:comments, on_delete: :nothing)


      timestamps()
    end
    create index(:comments, [:parent])
    create index(:comments, [:question_id])
    
  end
end
