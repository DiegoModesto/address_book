defmodule AddressBook.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AddressBookWeb.Telemetry,
      AddressBook.Repo,
      {DNSCluster, query: Application.get_env(:address_book, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: AddressBook.PubSub},
      {Finch, name: AddressBook.Finch},
      AddressBookWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: AddressBook.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    AddressBookWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
