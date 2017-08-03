defmodule Pittdesignhub.Repo.Migrations.CreateCharter do
  use Ecto.Migration

  def change do
    create table(:charters) do
      add :title, :string
      add :author, :string
      add :version, :string

      timestamps()
    end

  end
end
