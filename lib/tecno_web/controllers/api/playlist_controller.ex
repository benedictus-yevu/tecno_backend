defmodule TecnoWeb.ApiPlaylistController do
  use TecnoWeb, :controller
  alias Tecno.Multimedia
  alias Tecno.Multimedia.{Playlist}

  def index(conn, _params) do
    playlists = Multimedia.list_playlists()
    render(conn, "index.json", playlists: playlists)
  end

  def create(conn, %{"playlist" => playlist_params}) do
    with {:ok, %Playlist{} = playlist} <- Multimedia.create_playlist(playlist_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.playlist_path(conn, :show, playlist))
      |> render("show.json", playlist: playlist)
    end
  end

  def show(conn, %{"id" => id}) do
    playlist = Multimedia.get_playlist!(id)
    render(conn, "show.json", playlist: playlist)
  end

  def update(conn, %{"id" => id, "playlist" => playlist_params}) do
    playlist = Multimedia.get_playlist!(id)

    with {:ok, %Playlist{} = playlist} <- Multimedia.update_playlist(playlist, playlist_params) do
      render(conn, "show.json", playlist: playlist)
    end
  end

  def delete(conn, %{"id" => id}) do
    playlist = Multimedia.get_playlist!(id)

    with {:ok, %Playlist{}} <- Multimedia.delete_playlist(playlist) do
      send_resp(conn, :no_content, "")
    end
  end
end
