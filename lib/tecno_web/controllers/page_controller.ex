defmodule TecnoWeb.PageController do
  use TecnoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
