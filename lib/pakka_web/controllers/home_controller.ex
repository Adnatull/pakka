defmodule PakkaWeb.HomeController do
  use PakkaWeb, :controller

  alias Pakka.Accounts
  alias Pakka.Accounts.User
  import Plug.Conn

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

  def editprofile(conn, params) do
      render(conn, "edit.html")
  end

  def profile(conn, _) do
      render(conn, "profile.html")
  end

end
