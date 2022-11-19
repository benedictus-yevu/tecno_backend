defmodule Tecno.Schemaless.MusicPlan do
  alias Tecno.Schemaless.MusicPlan
  import Ecto.Changeset
  defstruct [:name, :plan_name]

  @types %{name: :string, plan_name: :string}

  def changeset(%MusicPlan{} = struct, attrs) do
    {struct, @types}
    |> cast(attrs, Map.keys(@types))
    |> validate_required([:name, :plan_name])
  end
end
