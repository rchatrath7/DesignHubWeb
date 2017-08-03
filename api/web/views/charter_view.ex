defmodule Pittdesignhub.CharterView do
  use Pittdesignhub.Web, :view

  alias Pittdesignhub.QuestionView

  def render("index.json", %{charters: charters}) do
    %{data: render_many(charters, Pittdesignhub.CharterView, "charter.json")}
  end

  def render("show.json", %{charter: charter}) do
    %{data: render_one(charter, Pittdesignhub.CharterView, "charter.json")}
  end

  def render("charter.json", %{charter: charter}) do
    %{id: charter.id,
      title: charter.title,
      author: charter.author,
      version: charter.version, 
      questions: render_many(charter.questions, QuestionView, "question.json")}
  end
end
