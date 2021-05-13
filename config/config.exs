# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gescon,
  ecto_repos: [Gescon.Repo]

# Configures the endpoint
config :gescon, GesconWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Cm1rXAfHSIv4ieLxgIty25ZMM/VqvVBFN6LF64zuN/SjpAIpnhZUdow7IeTa0Aiz",
  render_errors: [view: GesconWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Gescon.PubSub,
  live_view: [signing_salt: "nVtLdpug"]

# Guardian config
config :gescon, Gescon.Guardian,
  issuer: "gescon",
  secret_key: "QDmDB2SJkchLoZN26mNS3SgrQuSHWqiVhdpX1EA4wFKfmfQjUMH+WLwbvhpJ8nUe"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
