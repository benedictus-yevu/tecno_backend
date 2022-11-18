defmodule Tecno.Multimedia.Playlist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "playlists" do
    field :name, :string

    timestamps()
    belongs_to :user, Tecno.Accounts.User
  end

  @doc false
  def changeset(playlist, attrs) do
    playlist
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
