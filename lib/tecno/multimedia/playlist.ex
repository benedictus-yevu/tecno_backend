defmodule Tecno.Multimedia.Playlist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "playlists" do
    field :data, :map
    belongs_to :user, Tecno.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(playlist, attrs) do
    playlist
    |> cast(attrs, [:data])
    |> validate_required([:data])
  end
end
