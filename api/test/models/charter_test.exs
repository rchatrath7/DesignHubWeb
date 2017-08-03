defmodule Pittdesignhub.CharterTest do
  use Pittdesignhub.ModelCase

  alias Pittdesignhub.Charter

  @valid_attrs %{author: "some content", title: "some content", version: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Charter.changeset(%Charter{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Charter.changeset(%Charter{}, @invalid_attrs)
    refute changeset.valid?
  end
end
