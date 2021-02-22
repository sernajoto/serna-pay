defmodule SernaPay.Repo do
  use Ecto.Repo,
    otp_app: :serna_pay,
    adapter: Ecto.Adapters.Postgres
end
