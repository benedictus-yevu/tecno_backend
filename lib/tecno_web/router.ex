defmodule TecnoWeb.Router do
  use TecnoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TecnoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug TecnoWeb.Auth.Pipeline
  end

  scope "/api", TecnoWeb do
    pipe_through :api
    post "/users/signup", ApiUserController, :create
    post "/users/signin", UserController, :singin
  end

  scope "/api", TecnoWeb do
    pipe_through([:api, :auth])
    get "/musics", ApiMusicController, :index
    resources "/playlists", ApiPlaylistController
  end

  scope "/", TecnoWeb do
    pipe_through :browser
    resources "/users", UserController
    resources "/musics", MusicController
  end

  # Other scopes may use custom stacks.
  # scope "/api", TecnoWeb do
  #   pipe_through :api
  # end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
