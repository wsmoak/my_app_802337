use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :my_app_802337, MyApp_802337.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :my_app_802337, MyApp_802337.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "my_app_802337_test",
  pool: Ecto.Adapters.SQL.Sandbox
