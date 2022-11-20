defmodule TecnoWeb.SessionView do
  use TecnoWeb, :view

  def render("user_signup.json", %{user: user, token: token, plan: plan}) do
    %{
      email: user.email,
      token: token,
      plan: plan.plan_name
    }
  end

  def render("user_login.json", %{user: user, token: token, plan: plan, playlist: playlist}) do
    %{
      user: %{
        user: user,
        token: token,
        plan: plan,
        playlist: playlist
      }
    }
  end

  def render("error.json", %{message: message}) do
    %{
      status: :not_found,
      data: %{},
      message: message
    }
  end
end
