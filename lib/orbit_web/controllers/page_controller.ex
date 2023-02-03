defmodule OrbitWeb.PageController do
  use OrbitWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
