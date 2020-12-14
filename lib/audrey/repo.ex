defmodule Audrey.Repo do
  use Ecto.Repo,
    otp_app: :audrey,
    adapter: Ecto.Adapters.Postgres
end
