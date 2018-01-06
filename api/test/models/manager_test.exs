defmodule Pittdesignhub.ManagerTest do
  use Pittdesignhub.ModelCase

  alias Pittdesignhub.Manager

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Manager.changeset(%Manager{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Manager.changeset(%Manager{}, @invalid_attrs)
    refute changeset.valid?
  end
end
