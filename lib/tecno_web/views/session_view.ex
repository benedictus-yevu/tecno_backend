defmodule TecnoWeb.SessionView do
  use TecnoWeb, :view

  # def render("index.json", %{playlists: playlists}) do
  #   %{data: render_many(playlists, PlaylistView, "playlist.json")}
  # end

  # def render("show.json", %{user: user, token: token}) do
  #   %{
  #     email: user.email,
  #     token: token
  #   }
  # end
  def render("user.json", %{user: user, token: token}) do
    %{
      email: user.email,
      token: token
    }
  end

  def render("error.json", %{message: message}) do
    %{
      status: :not_found,
      data: %{},
      message: message
    }
  end

  # def render("show.json", %{user: user, token: token}) do
  #   # IO.inspect(user.email)
  #   %{data: render_one(user, TecnoWeb.ApiUserView, "user.json")}
  # end

  # def render("user.json", %{user: user}) do
  #   %{
  #     user: %{user}
  #   }
  # end

  # def render("show.json", %{user: user, token: token}) do
  #   %{
  #     data: %{email: user.email, token: token}
  #   }
  # end
end
