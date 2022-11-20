defmodule Tecno.GeneralQueries do
  alias Tecno.Accounts.User

  alias Tecno.Multimedia.Playlist
  alias Tecno.Repo
  import Ecto.Query

  # fetches a users playlist
  def show_user_playlist(email) do
    resp =
      Repo.get_by(User, email: email)
      |> Repo.preload(:playlist)

    resp.playlist
  end

  def get_user_plan(email) do
    resp =
      Repo.get_by(User, email: email)
      |> IO.inspect()
      |> Repo.preload(:plan)

    resp.plan
  end

  def get_user_playlist(email) do
    resp =
      Repo.get_by(User, email: email)
      |> Repo.preload(:playlist)

    case resp.playlist do
      nil ->
        %{}

      data ->
        data
    end
  end

  def create_play_list(params) do
    %{"email" => email, "data" => songs} = params

    Repo.get_by(User, email: email)
    |> Ecto.build_assoc(:playlist)
    |> Playlist.changeset(%{data: songs})
    |> Repo.insert()
  end
end
