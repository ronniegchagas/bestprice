defmodule Bestprice.Repo.Migrations.CreateBudgets do
  use Ecto.Migration

  def change do
    create table(:budgets) do
      add :name, :string
      add :description, :string
      add :slug, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:budgets, [:slug])
  end
end
