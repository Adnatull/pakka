defmodule PakkaWeb.AuthenticationController do
  use PakkaWeb, :controller

  alias Pakka.Accounts
  alias Pakka.Accounts.User
  import Plug.Conn


  plug :put_layout, "authentication.html"
  def index(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "index.html", changeset: changeset)
  end

  # web/controllers/session_controller.ex

  def log(conn, %{"user" => user_params}) do

    case Accounts.login(user_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Logged in")
        |> redirect(to: "/home")
      :error ->
        conn
        |> put_flash(:info, "Wrong email or password")
        |> redirect(to: "/")
    end
  end

  def signup(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: "/home")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "create.html", changeset: changeset)
    end
  end

  def register(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "create.html", changeset: changeset)
  #  render conn, "create.html"
  end



end
