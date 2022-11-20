defmodule TecnoWeb.PlaylistView do
  use TecnoWeb, :view

  def render("music.json", %{playlists: playlists}) do
    %{
      data: render_many(playlists, TecnoWeb.PageView, "playlist.json")
    }
  end

  def render("playlist.json", %{playlist: playlist}) do
    %{music: playlist.name}
  end

  def render("dummy.json", %{play: play}) do
    %{
      data: play
    }
  end

  def render("created_playlist.json", %{playlist: playlist}) do
    %{
      data: playlist
    }
  end
end
