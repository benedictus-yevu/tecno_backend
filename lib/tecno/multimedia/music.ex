defmodule Tecno.Multimedia.Music do
  use Ecto.Schema
  import Ecto.Changeset

  schema "musics" do
    field :name, :string

    belongs_to :plan, Tecno.Multimedia.Music
    timestamps()
  end

  @doc false
  def changeset(music, attrs) do
    music
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
