# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :appsignal_api_example,
  ecto_repos: [AppsignalApiExample.Repo],
  loggers: [Appsignal.Ecto, Ecto.LogEntry]

# Configures the endpoint
config :appsignal_api_example, AppsignalApiExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8N3cSr0+Gn/aPhjiPdQckbV0CKS+FDF8FAd4mQJn8gmw7Vygqgbcu6tdpg/hsb4D",
  render_errors: [view: AppsignalApiExampleWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: AppsignalApiExample.PubSub,
           adapter: Phoenix.PubSub.PG2],
  instrumenters: [Appsignal.Phoenix.Instrumenter]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  eex: Appsignal.Phoenix.Template.EExEngine,
  exs: Appsignal.Phoenix.Template.ExsEngine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

import_config "appsignal.exs"
