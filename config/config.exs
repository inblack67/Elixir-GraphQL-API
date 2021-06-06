# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gql,
  ecto_repos: [Gql.Repo]

# Configures the endpoint
config :gql, GqlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "reimba+nAxr+Y4nRAe7jOvwMSkbvOnkTptlbkPtqr6nG985yWjRyqIhzJxNuQJW5",
  render_errors: [view: GqlWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Gql.PubSub,
  live_view: [signing_salt: "tL6orhR9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# guardian
config :gql, Gql.Auth.Guardian,
  issuer: "gql",
  secret_key: "1e2tKk6Of660e71i1JgGdqfpOUs+8fH/pqHQoqn46Egj/QmNsi5bZwJiodoLtMMk"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
