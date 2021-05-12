defmodule Gescon.Repo do
  use Ecto.Repo,
    otp_app: :gescon,
    adapter: Ecto.Adapters.Postgres
end
