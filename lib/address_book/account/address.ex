defmodule AddressBook.Account.Address do
  use Ecto.Schema
  import Ecto.Changeset

  schema "address" do
    field :state, :string
    field :street, :string
    field :city, :string
    field :zipcode, :string

    belongs_to :user, AddressBook.Account.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:street, :city, :state, :zipcode, :user_id])
    |> validate_required([:street, :city, :state, :zipcode, :user_id])
  end
end
