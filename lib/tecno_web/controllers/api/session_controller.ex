defmodule TecnoWeb.SessionController do
  use TecnoWeb, :controller

  alias TecnoWeb.Auth.Guardian
  alias Tecno.Accounts
  alias Tecno.Accounts.User
  alias Tecno.GeneralQueries

  # action_fallback TecnoWeb.FallbackController

  def create(conn, %{"user" => user_params}) do
    IO.inspect(user_params)

    with {:ok, user} <- Accounts.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      plan = GeneralQueries.get_user_plan(user.email)

      conn
      |> put_status(:created)
      |> render("user_signup.json", user: user, token: token, plan: plan)
    end
  end

  def login(conn, %{"email" => email, "password" => password}) do
    with {:ok, user, token} <- Guardian.authenticate(email, password) do
      plan = GeneralQueries.get_user_plan(email)
      playlist = GeneralQueries.get_user_playlist(email)

      conn
      |> put_status(:ok)
      |> render("user_login.json", %{
        user: user.email,
        token: token,
        plan: plan.plan_name,
        playlist: playlist
      })
    end
  end

  def delete(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> text("Log out successful")
  end
end
