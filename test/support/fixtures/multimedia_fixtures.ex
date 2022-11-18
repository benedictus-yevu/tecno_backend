defmodule Tecno.MultimediaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tecno.Multimedia` context.
  """

  @doc """
  Generate a plan.
  """
  def plan_fixture(attrs \\ %{}) do
    {:ok, plan} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Tecno.Multimedia.create_plan()

    plan
  end

  @doc """
  Generate a playlist.
  """
  def playlist_fixture(attrs \\ %{}) do
    {:ok, playlist} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Tecno.Multimedia.create_playlist()

    playlist
  end

  @doc """
  Generate a music.
  """
  def music_fixture(attrs \\ %{}) do
    {:ok, music} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Tecno.Multimedia.create_music()

    music
  end
end
