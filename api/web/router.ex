defmodule Pittdesignhub.Router do
  use Pittdesignhub.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Pittdesignhub do
    pipe_through :api
  end
end
