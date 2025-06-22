defmodule AddressBookWeb.AddressControllerTest do
  use AddressBookWeb.ConnCase

  import AddressBook.AccountFixtures

  alias AddressBook.Account.Address

  @create_attrs %{
    state: "some state",
    stree: "some stree",
    city: "some city",
    cep: "some cep"
  }
  @update_attrs %{
    state: "some updated state",
    stree: "some updated stree",
    city: "some updated city",
    cep: "some updated cep"
  }
  @invalid_attrs %{state: nil, stree: nil, city: nil, cep: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all address", %{conn: conn} do
      conn = get(conn, ~p"/api/address")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create address" do
    test "renders address when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/address", address: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/address/#{id}")

      assert %{
               "id" => ^id,
               "cep" => "some cep",
               "city" => "some city",
               "state" => "some state",
               "stree" => "some stree"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/address", address: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update address" do
    setup [:create_address]

    test "renders address when data is valid", %{conn: conn, address: %Address{id: id} = address} do
      conn = put(conn, ~p"/api/address/#{address}", address: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/address/#{id}")

      assert %{
               "id" => ^id,
               "cep" => "some updated cep",
               "city" => "some updated city",
               "state" => "some updated state",
               "stree" => "some updated stree"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, address: address} do
      conn = put(conn, ~p"/api/address/#{address}", address: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete address" do
    setup [:create_address]

    test "deletes chosen address", %{conn: conn, address: address} do
      conn = delete(conn, ~p"/api/address/#{address}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/address/#{address}")
      end
    end
  end

  defp create_address(_) do
    address = address_fixture()
    %{address: address}
  end
end
