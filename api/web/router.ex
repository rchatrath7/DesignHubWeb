defmodule Pittdesignhub.Router do
  use Pittdesignhub.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/", Pittdesignhub do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", Pittdesignhub do
    pipe_through :api

    post "/sessions", SessionController, :create
    delete "/sessions", SessionController, :delete
    post "/sessions/refresh", SessionController, :refresh
    resources "/users", UserController, only: [:create]
    resources "/comments", CommentController, except: [:new, :edit]
    resources "/questions", QuestionController, except: [:new, :edit]
    resources "/charters", CharterController, except: [:new, :edit]
  end
end