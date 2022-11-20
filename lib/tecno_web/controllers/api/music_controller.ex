defmodule TecnoWeb.MusicApiController do
  use TecnoWeb, :controller
  alias Tecno.Multimedia
  alias Tecno.GeneralQueries
  alias Tecno.Repo
  alias Tecno.Multime

  # fetch music based on plan
  def index(conn, %{"email" => email}) do
    IO.inspect(email)
    plan = GeneralQueries.get_user_plan(email)

    case plan.plan_name do
      "Basic" ->
        musics = plan |> Repo.preload(:musics)
        render(conn, "index.json", musics: musics.musics)

      "Gold" ->
        musics = Multimedia.list_musics()
        render(conn, "index.json", musics: musics)
    end
  end
end
