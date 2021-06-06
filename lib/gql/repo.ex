defmodule Gql.Repo do
  use Ecto.Repo,
    otp_app: :gql,
    adapter: Ecto.Adapters.Postgres
end
