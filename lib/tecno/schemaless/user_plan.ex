defmodule Tecno.Schemaless.UserPlan do
  alias Tecno.Schemaless.UserPlan
  import Ecto.Changeset
  defstruct [:email, :password, :plan_name]

  @types %{email: :string, password: :string, plan_name: :string}

  def changeset(%UserPlan{} = struct, attrs) do
    {struct, @types}
    |> cast(attrs, Map.keys(@types))
    |> validate_required([:email, :password, :plan_name])
    |> validate_format(:email, ~r/^[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
    |> validate_length(:password, min: 6)
  end
end
