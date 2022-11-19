defmodule Tecno.Repo.Migrations.CreatePlans do
  use Ecto.Migration

  def change do
    create table(:plans) do
      add :plan_name, :string

      timestamps()
    end

    create unique_index(:plans, [:plan_name])
  end
end
