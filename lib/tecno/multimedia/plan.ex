defmodule Tecno.Multimedia.Plan do
  alias Tecno.Accounts
  use Ecto.Schema
  import Ecto.Changeset

  schema "plans" do
    field :plan_name, :string
    has_many :users, Accounts.User
    timestamps()
  end

  @doc false
  def changeset(plan, attrs) do
    plan
    |> cast(attrs, [:plan_name])
    |> validate_required([:plan_name])
  end
end
