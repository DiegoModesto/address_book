defmodule AddressBook.Repo.Migrations.CreateAddress do
  use Ecto.Migration

  def change do
    create table(:address) do
      add :stree, :string
      add :city, :string
      add :state, :string
      add :cep, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:address, [:user_id])
  end
end
