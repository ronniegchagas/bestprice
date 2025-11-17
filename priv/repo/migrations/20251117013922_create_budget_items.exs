defmodule Bestprice.Repo.Migrations.CreateBudgetItem do
  use Ecto.Migration

  def change do
    create table(:budget_items) do
      add :price, :decimal
      add :notes, :string
      add :budget_id, references(:budgets, on_delete: :nothing)
      add :store_id, references(:stores, on_delete: :nothing)
      add :product_id, references(:products, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end
  end
end
