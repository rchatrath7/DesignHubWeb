# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pittdesignhub,
  ecto_repos: [Pittdesignhub.Repo]

# Configures the endpoint
config :pittdesignhub, Pittdesignhub.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0QrpfVp4x/aIxMvRrzosXueE9WPfjCToYJKIqXUvZ4ui6QCthOG3ZAVQE+EpAn05",
  render_errors: [view: Pittdesignhub.ErrorView, accepts: ~w(json)],
  pubsub: [name: Pittdesignhub.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
config :guardian, Guardian,
  issuer: "Sling",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: Sling.GuardianSerializer

import_config "#{Mix.env}.exs"
