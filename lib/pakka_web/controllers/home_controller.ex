defmodule PakkaWeb.HomeController do
  use PakkaWeb, :controller

  alias Pakka.Accounts
  alias Pakka.Accounts.User
  import Plug.Conn
  alias Pakka.Repo

  def index(conn, _params) do
  #  changeset = Accounts.change_user(%User{})
    render(conn, "index.html")
  end

  def delete(conn, _) do
    conn
      |> delete_session(:current_user)
      |> put_flash(:info, "Logged out")
      |> redirect(to: "/home")
  end

#%{"id" => id}

  def editprofile(conn, _user) do
    changeset = Accounts.change_user(%User{})
    render(conn, "edit.html", changeset: changeset)
  end

  def profileupdate(conn, %{"user" => user_params}) do
  #  IO.inspect(user_params)
   # id = user_params["id"]
   # IO.puts(id)

    id = Plug.Conn.get_session(conn, :current_user)
    user = Repo.get!(User, id)

    #user = Accounts.get_user!(id)
    case Accounts.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "user updated successfully.")
        |> redirect(to: "/profile")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end

  end

  def profile(conn, _) do
      render(conn, "profile.html")
  end

end
