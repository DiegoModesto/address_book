defmodule AddressBook.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AddressBookWeb.Telemetry,
      AddressBook.Repo,
      {DNSCluster, query: Application.get_env(:address_book, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: AddressBook.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: AddressBook.Finch},
      # Start a worker by calling: AddressBook.Worker.start_link(arg)
      # {AddressBook.Worker, arg},
      # Start to serve requests, typically the last entry
      AddressBookWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AddressBook.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AddressBookWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
