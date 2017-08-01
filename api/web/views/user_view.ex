defmodule Pittdesignhub.UserView do
  use Pittdesignhub.Web, :view

  # def render("index.json", %{users: users}) do
 #    %{data: render_many(users, Pittdesignhub.UserView, "user.json")}
 #  end
 #
 #  def render("show.json", %{user: user}) do
 #    %{data: render_one(user, Pittdesignhub.UserView, "user.json")}
 #  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      email: user.email,
      name: user.name}
  end
end
