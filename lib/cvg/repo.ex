defmodule Cvg.Repo do
  use Ecto.Repo,
    otp_app: :cvg,
    adapter: Ecto.Adapters.Postgres
end
