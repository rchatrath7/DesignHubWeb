defmodule Pittdesignhub.TeamView do
  use Pittdesignhub.Web, :view

  def render("index.json", %{teams: teams}) do
    %{data: render_many(teams, Pittdesignhub.TeamView, "team.json")}
  end

  def render("show.json", %{team: team}) do
    %{data: render_one(team, Pittdesignhub.TeamView, "team.json")}
  end

  def render("team.json", %{team: team}) do
    %{id: team.id,
      name: team.name,
      is_active: team.is_active}
  end
end
