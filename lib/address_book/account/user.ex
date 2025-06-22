defmodule AddressBook.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :telefone, :string

    has_many :addresses, AddressBook.Account.Address

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :telefone])
    |> validate_required([:name, :email, :telefone])
    |> unique_constraint(:email)
  end
end
