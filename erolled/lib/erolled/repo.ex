defmodule Erolled.Repo do
  use Ecto.Repo,
    otp_app: :erolled,
    adapter: Ecto.Adapters.Postgres
end
