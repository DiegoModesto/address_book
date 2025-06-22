defmodule AddressBook.Repo.Migrations.FixAddressFieldsName do
  use Ecto.Migration

  def change do
    rename table(:address), :stree, to: :street
    rename table(:address), :cep, to: :zipcode
  end
end
