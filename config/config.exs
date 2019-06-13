# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :medium_graphql_api,
  ecto_repos: [MediumGraphqlApi.Repo]

# Configures the endpoint
config :medium_graphql_api, MediumGraphqlApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DkuSa/4/E81FuxW4B9jBEykJIamON4sG5tUblJwJhwt9sIazEHGKXmPw+bXDNIGc",
  render_errors: [view: MediumGraphqlApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MediumGraphqlApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian config
config :medium_graphql_api, MediumGraphqlApi.Guardian,
       issuer: "medium_graphql_api",
       secret_key: "4VGxtto3zJjwwgsKl/Ajw7EwUzF3pZ4O50Q7wzioTGwILpMCSzjEOAedkLCuT62O"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
