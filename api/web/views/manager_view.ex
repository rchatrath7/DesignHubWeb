defmodule Pittdesignhub.ManagerView do
  use Pittdesignhub.Web, :view

  def render("index.json", %{managers: managers}) do
    %{data: render_many(managers, Pittdesignhub.ManagerView, "manager.json")}
  end

  def render("show.json", %{manager: manager}) do
    %{data: render_one(manager, Pittdesignhub.ManagerView, "manager.json")}
  end

  def render("manager.json", %{manager: manager}) do
    %{id: manager.id,
      user_id: manager.user_id}
  end
end
