import Config

# Configure your database
config :address_book, AddressBook.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "address_book_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 50

config :address_book, AddressBookWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "hIVZPY04kDKtmnWXh5g0F8VbsbMVFKSWXe91INfrxLfplrXX0av+gBjPEeZjZzFn",
  watchers: []

config :address_book, dev_routes: true
config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime
config :swoosh, :api_client, false
