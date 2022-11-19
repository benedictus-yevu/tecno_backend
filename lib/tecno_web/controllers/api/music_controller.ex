defmodule TecnoWeb.ApiMusicController do
  use TecnoWeb, :controller
  alias Tecno.Multimedia

  def index(conn, _params) do
    musics = Multimedia.list_musics()
    render(conn, "index.json", musics: musics)
  end
end
