defmodule AddressBook.Account do
  import Ecto.Query, warn: false
  alias AddressBook.Repo

  alias AddressBook.Account.User

  def list_users do
    Repo.all(User) |> Repo.preload(:addresses)
  end

  def get_user!(id), do: Repo.get!(User, id) |> Repo.preload(:addresses)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias AddressBook.Account.Address

  def list_address do
    Repo.all(Address)
  end

  def get_address!(id), do: Repo.get!(Address, id)

  def create_address(attrs \\ %{}) do
    %Address{}
    |> Address.changeset(attrs)
    |> Repo.insert()
  end

  def update_address(%Address{} = address, attrs) do
    address
    |> Address.changeset(attrs)
    |> Repo.update()
  end

   def delete_address(%Address{} = address) do
    Repo.delete(address)
  end

  def change_address(%Address{} = address, attrs \\ %{}) do
    Address.changeset(address, attrs)
  end
end
