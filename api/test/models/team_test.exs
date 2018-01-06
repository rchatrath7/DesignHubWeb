defmodule Pittdesignhub.TeamTest do
  use Pittdesignhub.ModelCase

  alias Pittdesignhub.Team

  @valid_attrs %{is_active: true, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Team.changeset(%Team{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Team.changeset(%Team{}, @invalid_attrs)
    refute changeset.valid?
  end
end
