defmodule Pittdesignhub.CommentTest do
  use Pittdesignhub.ModelCase

  alias Pittdesignhub.Comment

  @valid_attrs %{author: "some content", comment: "some content", resolved: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Comment.changeset(%Comment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Comment.changeset(%Comment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
