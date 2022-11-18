defmodule Tecno.Repo.Migrations.CreatePlaylists do
  use Ecto.Migration

  def change do
    create table(:playlists) do
      add :data, :map, null: false, default: %{}
      add :user_id, references(:users)
      timestamps()
    end
  end
end
