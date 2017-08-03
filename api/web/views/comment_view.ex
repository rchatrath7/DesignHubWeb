defmodule Pittdesignhub.CommentView do
  use Pittdesignhub.Web, :view

  def render("index.json", %{comments: comments}) do
    %{data: render_many(comments, Pittdesignhub.CommentView, "comment.json")}
  end

  def render("show.json", %{comment: comment}) do
    %{data: render_one(comment, Pittdesignhub.CommentView, "comment.json")}
  end

  def render("comment.json", %{comment: comment}) do
    %{id: comment.id,
      author: comment.author,
      resolved: comment.resolved,
      comment: comment.comment,
      parent_id: comment.parent_id, 
      question_id: comment.question_id}
      |> add_children(comment)
  end

  defp add_children(json, %{children: children}) when is_list (children) do 
    child = 
      children 
      |> render_many(Pittdesignhub.CommentView, "show.json")
    Map.put(json, :children, child)
  end

  defp add_children(json, _comment) do 
    json
  end 
end
