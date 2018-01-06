defmodule Pittdesignhub.ManagerController do
  use Pittdesignhub.Web, :controller

  alias Pittdesignhub.Manager

  def index(conn, _params) do
    managers = Repo.all(Manager)
    render(conn, "index.json", managers: managers)
  end

  def create(conn, %{"manager" => manager_params}) do
    changeset = Manager.changeset(%Manager{}, manager_params)

    case Repo.insert(changeset) do
      {:ok, manager} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", manager_path(conn, :show, manager))
        |> render("show.json", manager: manager)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Pittdesignhub.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    manager = Repo.get!(Manager, id)
    render(conn, "show.json", manager: manager)
  end

  def update(conn, %{"id" => id, "manager" => manager_params}) do
    manager = Repo.get!(Manager, id)
    changeset = Manager.changeset(manager, manager_params)

    case Repo.update(changeset) do
      {:ok, manager} ->
        render(conn, "show.json", manager: manager)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Pittdesignhub.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    manager = Repo.get!(Manager, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(manager)

    send_resp(conn, :no_content, "")
  end
end
