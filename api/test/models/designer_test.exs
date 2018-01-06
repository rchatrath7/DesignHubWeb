defmodule Pittdesignhub.DesignerTest do
  use Pittdesignhub.ModelCase

  alias Pittdesignhub.Designer

  @valid_attrs %{class: "some content", graduation_year: 42, major: "some content", minor: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Designer.changeset(%Designer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Designer.changeset(%Designer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
