defmodule AddressBook.Account.Address do
  use Ecto.Schema
  import Ecto.Changeset

  schema "address" do
    field :state, :string
    field :stree, :string
    field :city, :string
    field :cep, :string

    belongs_to :user, AddressBook.Account.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:stree, :city, :state, :cep])
    |> validate_required([:stree, :city, :state, :cep])
  end
end
