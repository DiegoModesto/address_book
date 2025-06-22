defmodule AddressBookWeb.AddressController do
  use AddressBookWeb, :controller

  alias AddressBook.Account
  alias AddressBook.Account.Address

  action_fallback AddressBookWeb.FallbackController

  def index(conn, _params) do
    address = Account.list_address()
    render(conn, :index, address: address)
  end

  def create(conn, %{"address" => address_params}) do
    with {:ok, %Address{} = address} <- Account.create_address(address_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/address/#{address}")
      |> render(:show, address: address)
    end
  end

  def show(conn, %{"id" => id}) do
    address = Account.get_address!(id)
    render(conn, :show, address: address)
  end

  def update(conn, %{"id" => id, "address" => address_params}) do
    address = Account.get_address!(id)

    with {:ok, %Address{} = address} <- Account.update_address(address, address_params) do
      render(conn, :show, address: address)
    end
  end

  def delete(conn, %{"id" => id}) do
    address = Account.get_address!(id)

    with {:ok, %Address{}} <- Account.delete_address(address) do
      send_resp(conn, :no_content, "")
    end
  end
end
