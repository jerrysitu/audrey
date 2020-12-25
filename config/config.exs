# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :audrey,
  ecto_repos: [Audrey.Repo]

# Configures the endpoint
config :audrey, AudreyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vqdSItFU0M5FFYPWFZ5LXvfiPq3GpKZjuMnPaKmQk7HHLgVHJ3uHBAvC7aE//oCK",
  render_errors: [view: AudreyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Audrey.PubSub,
  live_view: [signing_salt: "ky6lXY+v"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# custom config
config :audrey, env: Mix.env()

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
