defmodule Pittdesignhub.QuestionView do
  use Pittdesignhub.Web, :view

  alias Pittdesignhub.CommentView

  def render("index.json", %{questions: questions}) do
    %{data: render_many(questions, Pittdesignhub.QuestionView, "question.json")}
  end

  def render("show.json", %{question: question}) do
    %{data: render_one(question, Pittdesignhub.QuestionView, "question.json")}
  end

  def render("question.json", %{question: question}) do
    %{id: question.id,
      description: question.description,
      response: question.response,
      charter_id: question.charter_id}
      |> add_comments(question)
  end

  defp add_comments(json, %{comments: comment}) when is_list(comment) do 
    children = 
      comment
      |> render_many(CommentView, "show.json")
    Map.put(json, :comments, children)
  end 

  defp add_comments(json, _question) do 
    json 
  end 

end
