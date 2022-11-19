defmodule TecnoWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :tecno

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
end
