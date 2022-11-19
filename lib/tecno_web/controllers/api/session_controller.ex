defmodule TecnoWeb.SessionController do
  use TecnoWeb, :controller

  alias TecnoWeb.Auth.Guardian
  alias Tecno.Accounts
  alias Tecno.Accounts.User

  # action_fallback TecnoWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, user} <- Accounts.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("user.json", user: user, token: token)
    end
  end

  def login(conn, %{"email" => email, "password" => password}) do
    with {:ok, user, token} <- Guardian.authenticate(email, password) do
      conn
      |> put_status(:created)
      |> render("user.json", %{user: user, token: token})
    end
  end

  def refresh(conn, _) do
    refresh_token =
      Plug.Conn.fetch_cookies(conn) |> Map.from_struct() |> get_in([:cookies, "ruid"])

    case Guardian.exchange(refresh_token, "refresh", "access") do
      {
        :ok,
        _old,
        {new_access_token, "refresh", "access"}
      } ->
        conn
        |> put_status(:created)
        |> render("token.json", %{access_token: new_access_token})

      {:error, _} ->
        body = Jason.encode!(%{error: "unauthorized"})

        conn
        |> send_resp(401, body)
    end
  end

  def delete(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> text("Log out successful")
  end
end
