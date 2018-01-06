defmodule Pittdesignhub.DesignerControllerTest do
  use Pittdesignhub.ConnCase

  alias Pittdesignhub.Designer
  @valid_attrs %{class: "some content", graduation_year: 42, major: "some content", minor: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, designer_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    designer = Repo.insert! %Designer{}
    conn = get conn, designer_path(conn, :show, designer)
    assert json_response(conn, 200)["data"] == %{"id" => designer.id,
      "user_id" => designer.user_id,
      "class" => designer.class,
      "graduation_year" => designer.graduation_year,
      "major" => designer.major,
      "minor" => designer.minor}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, designer_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, designer_path(conn, :create), designer: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Designer, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, designer_path(conn, :create), designer: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    designer = Repo.insert! %Designer{}
    conn = put conn, designer_path(conn, :update, designer), designer: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Designer, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    designer = Repo.insert! %Designer{}
    conn = put conn, designer_path(conn, :update, designer), designer: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    designer = Repo.insert! %Designer{}
    conn = delete conn, designer_path(conn, :delete, designer)
    assert response(conn, 204)
    refute Repo.get(Designer, designer.id)
  end
end
