defmodule TecnoWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :tecno

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  # plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
end
