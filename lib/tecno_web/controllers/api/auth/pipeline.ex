defmodule TecnoWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :tecno,
    module: TecnoWeb.Auth.Guardian,
    error_handler: TecnoWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
