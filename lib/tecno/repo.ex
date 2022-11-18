defmodule Tecno.Repo do
  use Ecto.Repo,
    otp_app: :tecno,
    adapter: Ecto.Adapters.Postgres
end
