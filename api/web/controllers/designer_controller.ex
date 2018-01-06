defmodule Pittdesignhub.DesignerController do
  use Pittdesignhub.Web, :controller

  alias Pittdesignhub.Designer

  def index(conn, _params) do
    designers = Repo.all(Designer)
    render(conn, "index.json", designers: designers)
  end

  def create(conn, %{"designer" => designer_params}) do
    changeset = Designer.changeset(%Designer{}, designer_params)

    case Repo.insert(changeset) do
      {:ok, designer} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", designer_path(conn, :show, designer))
        |> render("show.json", designer: designer)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Pittdesignhub.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    designer = Repo.get!(Designer, id)
    render(conn, "show.json", designer: designer)
  end

  def update(conn, %{"id" => id, "designer" => designer_params}) do
    designer = Repo.get!(Designer, id)
    changeset = Designer.changeset(designer, designer_params)

    case Repo.update(changeset) do
      {:ok, designer} ->
        render(conn, "show.json", designer: designer)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Pittdesignhub.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    designer = Repo.get!(Designer, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(designer)

    send_resp(conn, :no_content, "")
  end
end
