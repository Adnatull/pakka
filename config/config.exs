# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pakka,
  ecto_repos: [Pakka.Repo]

# Configures the endpoint
config :pakka, PakkaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yzom939hn8htae41fcTvwDO0iGp7DmucM7MN3vTSj3RHGtpfkzRybiJkpr2Q2nG0",
  render_errors: [view: PakkaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pakka.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
