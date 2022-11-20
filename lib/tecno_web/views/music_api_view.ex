defmodule TecnoWeb.MusicApiView do
  use TecnoWeb, :view

  def render("index.json", %{musics: musics}) do
    %{songs: Enum.map(musics, fn music -> %{name: music.name} end)}
  end

  # def render("music.json", %{music: music}) do
  #   %{music: music.name}
  # end
end
