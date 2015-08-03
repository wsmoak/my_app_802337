defmodule MyApp_802337.Router do
  use MyApp_802337.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyApp_802337 do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", MyApp_802337 do
    pipe_through :api
    resources "/tasks", TaskController
  end
end
