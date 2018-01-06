defmodule Pittdesignhub.DesignerView do
  use Pittdesignhub.Web, :view

  def render("index.json", %{designers: designers}) do
    %{data: render_many(designers, Pittdesignhub.DesignerView, "designer.json")}
  end

  def render("show.json", %{designer: designer}) do
    %{data: render_one(designer, Pittdesignhub.DesignerView, "designer.json")}
  end

  def render("designer.json", %{designer: designer}) do
    %{id: designer.id,
      user_id: designer.user_id,
      class: designer.class,
      graduation_year: designer.graduation_year,
      major: designer.major,
      minor: designer.minor}
  end
end
