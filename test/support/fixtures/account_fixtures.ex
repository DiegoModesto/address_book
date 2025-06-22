defmodule AddressBook.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AddressBook.Account` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: unique_user_email(),
        name: "some name",
        telefone: "some telefone"
      })
      |> AddressBook.Account.create_user()

    user
  end

  @doc """
  Generate a address.
  """
  def address_fixture(attrs \\ %{}) do
    {:ok, address} =
      attrs
      |> Enum.into(%{
        cep: "some cep",
        city: "some city",
        state: "some state",
        stree: "some stree"
      })
      |> AddressBook.Account.create_address()

    address
  end
end
