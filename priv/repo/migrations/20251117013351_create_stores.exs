defmodule Bestprice.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :name, :string
      add :address, :string
      add :zip_code, :string
      add :phone, :string

      timestamps(type: :utc_datetime)
    end
  end
end
