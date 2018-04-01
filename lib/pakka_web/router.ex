defmodule PakkaWeb.Router do
  use PakkaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PakkaWeb do
    pipe_through :browser # Use the default browser stack

    get "/", AuthenticationController, :index
    post "/", AuthenticationController, :log
    get "/register", AuthenticationController, :register
    post "/register", AuthenticationController, :signup


    get "/home", HomeController, :index
    get "/delete", HomeController, :delete
    get "/profile", HomeController, :profile
    get "/editprofile", HomeController, :editprofile

    resources "/admins", AdminController

  end

  # Other scopes may use custom stacks.
  # scope "/api", PakkaWeb do
  #   pipe_through :api
  # end
end
