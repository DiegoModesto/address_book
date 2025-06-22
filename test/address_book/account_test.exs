defmodule AddressBook.AccountTest do
  use AddressBook.DataCase

  alias AddressBook.Account

  describe "users" do
    alias AddressBook.Account.User

    import AddressBook.AccountFixtures

    @invalid_attrs %{name: nil, email: nil, telefone: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name", email: "some email", telefone: "some telefone"}

      assert {:ok, %User{} = user} = Account.create_user(valid_attrs)
      assert user.name == "some name"
      assert user.email == "some email"
      assert user.telefone == "some telefone"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some updated name", email: "some updated email", telefone: "some updated telefone"}

      assert {:ok, %User{} = user} = Account.update_user(user, update_attrs)
      assert user.name == "some updated name"
      assert user.email == "some updated email"
      assert user.telefone == "some updated telefone"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end

  describe "address" do
    alias AddressBook.Account.Address

    import AddressBook.AccountFixtures

    @invalid_attrs %{state: nil, stree: nil, city: nil, cep: nil}

    test "list_address/0 returns all address" do
      address = address_fixture()
      assert Account.list_address() == [address]
    end

    test "get_address!/1 returns the address with given id" do
      address = address_fixture()
      assert Account.get_address!(address.id) == address
    end

    test "create_address/1 with valid data creates a address" do
      valid_attrs = %{state: "some state", stree: "some stree", city: "some city", cep: "some cep"}

      assert {:ok, %Address{} = address} = Account.create_address(valid_attrs)
      assert address.state == "some state"
      assert address.stree == "some stree"
      assert address.city == "some city"
      assert address.cep == "some cep"
    end

    test "create_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_address(@invalid_attrs)
    end

    test "update_address/2 with valid data updates the address" do
      address = address_fixture()
      update_attrs = %{state: "some updated state", stree: "some updated stree", city: "some updated city", cep: "some updated cep"}

      assert {:ok, %Address{} = address} = Account.update_address(address, update_attrs)
      assert address.state == "some updated state"
      assert address.stree == "some updated stree"
      assert address.city == "some updated city"
      assert address.cep == "some updated cep"
    end

    test "update_address/2 with invalid data returns error changeset" do
      address = address_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_address(address, @invalid_attrs)
      assert address == Account.get_address!(address.id)
    end

    test "delete_address/1 deletes the address" do
      address = address_fixture()
      assert {:ok, %Address{}} = Account.delete_address(address)
      assert_raise Ecto.NoResultsError, fn -> Account.get_address!(address.id) end
    end

    test "change_address/1 returns a address changeset" do
      address = address_fixture()
      assert %Ecto.Changeset{} = Account.change_address(address)
    end
  end
end
