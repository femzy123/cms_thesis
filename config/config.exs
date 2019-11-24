# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cms,
  ecto_repos: [Cms.Repo]

# Configures the endpoint
config :cms, CmsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EfYQC8DMYTMViTqnNKtxzmfwIcPJOsxu558P7Dy4d2KFQw09gL4uB2akhgO2ASSE",
  render_errors: [view: CmsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cms.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Thesis Main Config
config :thesis,
  store: Thesis.EctoStore,
  authorization: Cms.ThesisAuth,
  uploader: Thesis.RepoUploader

config :thesis, :dynamic_pages,
  view: CmsWeb.PageView,
  templates: ["blog.html"],
  not_found_view: CmsWeb.ErrorView,
  not_found_template: "404.html"

# Thesis Store Config
config :thesis, Thesis.EctoStore, repo: Cms.Repo

# Thesis Notifications Config
# config :thesis, :notifications,
#   add_page: [],
#   page_settings: [],
#   import_export_restore: []

# Thesis Dynamic Pages Config
# config :thesis, :dynamic_pages,
#   view: CmsWeb.PageView,
#   templates: ["index.html", "otherview.html"],
#   not_found_view: CmsWeb.ErrorView,
#   not_found_template: "404.html"

