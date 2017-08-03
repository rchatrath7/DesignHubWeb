defmodule Pittdesignhub.CharterControllerTest do
  use Pittdesignhub.ConnCase

  alias Pittdesignhub.Charter
  @valid_attrs %{author: "some content", title: "some content", version: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, charter_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    charter = Repo.insert! %Charter{}
    conn = get conn, charter_path(conn, :show, charter)
    assert json_response(conn, 200)["data"] == %{"id" => charter.id,
      "title" => charter.title,
      "author" => charter.author,
      "version" => charter.version}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, charter_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, charter_path(conn, :create), charter: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Charter, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, charter_path(conn, :create), charter: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    charter = Repo.insert! %Charter{}
    conn = put conn, charter_path(conn, :update, charter), charter: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Charter, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    charter = Repo.insert! %Charter{}
    conn = put conn, charter_path(conn, :update, charter), charter: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    charter = Repo.insert! %Charter{}
    conn = delete conn, charter_path(conn, :delete, charter)
    assert response(conn, 204)
    refute Repo.get(Charter, charter.id)
  end
end
