defmodule Pittdesignhub.CharterController do
  use Pittdesignhub.Web, :controller

  alias Pittdesignhub.Charter

  def index(conn, _params) do
    charters = Charter 
      |> Repo.all()
      |> Repo.preload([{:questions, [{:comments, :children}]}])
    render(conn, "index.json", charters: charters)
  end

  def create(conn, %{"charter" => charter_params}) do
    changeset = Charter.changeset(%Charter{}, charter_params)

    case Repo.insert(changeset) do
      {:ok, charter} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", charter_path(conn, :show, charter))
        |> render("show.json", charter: charter)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Pittdesignhub.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    charter = Repo.get!(Charter, id)
      |> Repo.preload([{:questions, [{:comments, :children}]}])
    render(conn, "show.json", charter: charter)
  end

  def update(conn, %{"id" => id, "charter" => charter_params}) do
    charter = Repo.get!(Charter, id)
    changeset = Charter.changeset(charter, charter_params)

    case Repo.update(changeset) do
      {:ok, charter} ->
        render(conn, "show.json", charter: charter)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Pittdesignhub.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    charter = Repo.get!(Charter, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(charter)

    send_resp(conn, :no_content, "")
  end
end
