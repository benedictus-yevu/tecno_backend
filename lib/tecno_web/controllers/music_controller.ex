defmodule TecnoWeb.MusicController do
  use TecnoWeb, :controller

  alias Tecno.Multimedia
  alias Tecno.Multimedia.Music

  def index(conn, _params) do
    musics = Multimedia.list_musics()
    render(conn, "index.html", musics: musics)
  end

  def new(conn, _params) do
    changeset = Multimedia.change_music(%Music{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"music" => music_params}) do
    case Multimedia.create_music(music_params) do
      {:ok, music} ->
        conn
        |> put_flash(:info, "Music created successfully.")
        |> redirect(to: Routes.music_path(conn, :show, music))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    music = Multimedia.get_music!(id)
    render(conn, "show.html", music: music)
  end

  def edit(conn, %{"id" => id}) do
    music = Multimedia.get_music!(id)
    changeset = Multimedia.change_music(music)
    render(conn, "edit.html", music: music, changeset: changeset)
  end

  def update(conn, %{"id" => id, "music" => music_params}) do
    music = Multimedia.get_music!(id)

    case Multimedia.update_music(music, music_params) do
      {:ok, music} ->
        conn
        |> put_flash(:info, "Music updated successfully.")
        |> redirect(to: Routes.music_path(conn, :show, music))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", music: music, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    music = Multimedia.get_music!(id)
    {:ok, _music} = Multimedia.delete_music(music)

    conn
    |> put_flash(:info, "Music deleted successfully.")
    |> redirect(to: Routes.music_path(conn, :index))
  end
end
