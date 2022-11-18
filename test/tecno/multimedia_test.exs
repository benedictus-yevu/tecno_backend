defmodule Tecno.MultimediaTest do
  use Tecno.DataCase

  alias Tecno.Multimedia

  describe "plans" do
    alias Tecno.Multimedia.Plan

    import Tecno.MultimediaFixtures

    @invalid_attrs %{name: nil}

    test "list_plans/0 returns all plans" do
      plan = plan_fixture()
      assert Multimedia.list_plans() == [plan]
    end

    test "get_plan!/1 returns the plan with given id" do
      plan = plan_fixture()
      assert Multimedia.get_plan!(plan.id) == plan
    end

    test "create_plan/1 with valid data creates a plan" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Plan{} = plan} = Multimedia.create_plan(valid_attrs)
      assert plan.name == "some name"
    end

    test "create_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Multimedia.create_plan(@invalid_attrs)
    end

    test "update_plan/2 with valid data updates the plan" do
      plan = plan_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Plan{} = plan} = Multimedia.update_plan(plan, update_attrs)
      assert plan.name == "some updated name"
    end

    test "update_plan/2 with invalid data returns error changeset" do
      plan = plan_fixture()
      assert {:error, %Ecto.Changeset{}} = Multimedia.update_plan(plan, @invalid_attrs)
      assert plan == Multimedia.get_plan!(plan.id)
    end

    test "delete_plan/1 deletes the plan" do
      plan = plan_fixture()
      assert {:ok, %Plan{}} = Multimedia.delete_plan(plan)
      assert_raise Ecto.NoResultsError, fn -> Multimedia.get_plan!(plan.id) end
    end

    test "change_plan/1 returns a plan changeset" do
      plan = plan_fixture()
      assert %Ecto.Changeset{} = Multimedia.change_plan(plan)
    end
  end

  describe "playlists" do
    alias Tecno.Multimedia.Playlist

    import Tecno.MultimediaFixtures

    @invalid_attrs %{name: nil}

    test "list_playlists/0 returns all playlists" do
      playlist = playlist_fixture()
      assert Multimedia.list_playlists() == [playlist]
    end

    test "get_playlist!/1 returns the playlist with given id" do
      playlist = playlist_fixture()
      assert Multimedia.get_playlist!(playlist.id) == playlist
    end

    test "create_playlist/1 with valid data creates a playlist" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Playlist{} = playlist} = Multimedia.create_playlist(valid_attrs)
      assert playlist.name == "some name"
    end

    test "create_playlist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Multimedia.create_playlist(@invalid_attrs)
    end

    test "update_playlist/2 with valid data updates the playlist" do
      playlist = playlist_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Playlist{} = playlist} = Multimedia.update_playlist(playlist, update_attrs)
      assert playlist.name == "some updated name"
    end

    test "update_playlist/2 with invalid data returns error changeset" do
      playlist = playlist_fixture()
      assert {:error, %Ecto.Changeset{}} = Multimedia.update_playlist(playlist, @invalid_attrs)
      assert playlist == Multimedia.get_playlist!(playlist.id)
    end

    test "delete_playlist/1 deletes the playlist" do
      playlist = playlist_fixture()
      assert {:ok, %Playlist{}} = Multimedia.delete_playlist(playlist)
      assert_raise Ecto.NoResultsError, fn -> Multimedia.get_playlist!(playlist.id) end
    end

    test "change_playlist/1 returns a playlist changeset" do
      playlist = playlist_fixture()
      assert %Ecto.Changeset{} = Multimedia.change_playlist(playlist)
    end
  end

  describe "musics" do
    alias Tecno.Multimedia.Music

    import Tecno.MultimediaFixtures

    @invalid_attrs %{name: nil}

    test "list_musics/0 returns all musics" do
      music = music_fixture()
      assert Multimedia.list_musics() == [music]
    end

    test "get_music!/1 returns the music with given id" do
      music = music_fixture()
      assert Multimedia.get_music!(music.id) == music
    end

    test "create_music/1 with valid data creates a music" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Music{} = music} = Multimedia.create_music(valid_attrs)
      assert music.name == "some name"
    end

    test "create_music/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Multimedia.create_music(@invalid_attrs)
    end

    test "update_music/2 with valid data updates the music" do
      music = music_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Music{} = music} = Multimedia.update_music(music, update_attrs)
      assert music.name == "some updated name"
    end

    test "update_music/2 with invalid data returns error changeset" do
      music = music_fixture()
      assert {:error, %Ecto.Changeset{}} = Multimedia.update_music(music, @invalid_attrs)
      assert music == Multimedia.get_music!(music.id)
    end

    test "delete_music/1 deletes the music" do
      music = music_fixture()
      assert {:ok, %Music{}} = Multimedia.delete_music(music)
      assert_raise Ecto.NoResultsError, fn -> Multimedia.get_music!(music.id) end
    end

    test "change_music/1 returns a music changeset" do
      music = music_fixture()
      assert %Ecto.Changeset{} = Multimedia.change_music(music)
    end
  end
end
