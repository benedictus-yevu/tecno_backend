defmodule TecnoWeb.PlaylistController do
  use TecnoWeb, :controller
  alias TecnoWeb.Auth.Guardian
  alias Tecno.Multimedia
  alias Tecno.Multimedia.{Playlist}
  alias Tecno.Accounts.User
  alias Tecno.Repo
  alias Tecno.GeneralQueries

  def index(conn, _params) do
    # IO.inspect(fetch_session(conn, :user), label: "data")
    playlists = Multimedia.list_playlists()
    render(conn, "music.json", playlists: playlists)
  end

  def create(conn, params) do
    IO.inspect(params)

    with {:ok, playlist} <- GeneralQueries.create_play_list(params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.playlist_path(conn, :show, playlist))
      |> render("created_playlist.json", playlist: playlist.data)
    end
  end

  def show(conn, %{"id" => email}) do
    case GeneralQueries.show_user_playlist(email) do
      data ->
        render(conn, "dummy.json", play: data)

      nil ->
        plan = %{}
        render(conn, "dummy.json", play: %{})
    end
  end

  # def update(conn, %{"id" => email, "playlist" => playlist_params}) do
  #   #1get user account
  #   #2update user data with playlist
  #   data = Repo.get_by(User,email: email)
  #   data

  #   with {:ok, %Playlist{} = playlist} <- Multimedia.update_playlist(playlist, playlist_params) do
  #     render(conn, "show.json", playlist: playlist)
  #   end
  # end

  def delete(conn, %{"id" => id}) do
    playlist = Multimedia.get_playlist!(id)

    with {:ok, %Playlist{}} <- Multimedia.delete_playlist(playlist) do
      send_resp(conn, :no_content, "")
    end
  end
end
