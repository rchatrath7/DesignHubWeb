defmodule Pittdesignhub.ManagerControllerTest do
  use Pittdesignhub.ConnCase

  alias Pittdesignhub.Manager
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, manager_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    manager = Repo.insert! %Manager{}
    conn = get conn, manager_path(conn, :show, manager)
    assert json_response(conn, 200)["data"] == %{"id" => manager.id,
      "user_id" => manager.user_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, manager_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, manager_path(conn, :create), manager: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Manager, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, manager_path(conn, :create), manager: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    manager = Repo.insert! %Manager{}
    conn = put conn, manager_path(conn, :update, manager), manager: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Manager, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    manager = Repo.insert! %Manager{}
    conn = put conn, manager_path(conn, :update, manager), manager: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    manager = Repo.insert! %Manager{}
    conn = delete conn, manager_path(conn, :delete, manager)
    assert response(conn, 204)
    refute Repo.get(Manager, manager.id)
  end
end
