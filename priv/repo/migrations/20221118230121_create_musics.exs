defmodule Tecno.Repo.Migrations.CreateMusics do
  use Ecto.Migration

  def change do
    create table(:musics) do
      add :name, :string
      add :plan_id, references(:plans)
      timestamps()
    end
  end
end
