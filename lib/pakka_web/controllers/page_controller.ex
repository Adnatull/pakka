defmodule PakkaWeb.PageController do
  use PakkaWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
