defmodule TecnoWeb.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  # look into connection
  # grab userid out of session
  # fetch user
  def init(_params) do
  end

  def call(conn, _params) do
    token = get_session(conn, :token)
    # IO.inspect(user)
    assign(conn, :token, token)
  end
end
