defmodule Tecno.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :plan_id, references(:plans)
      timestamps()
    end
  end
end
