defmodule Bestprice.BudgetItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "budget_items" do
    field :price, :decimal
    field :notes, :string

    belongs_to :budget, Bestprice.Budget
    belongs_to :store, Bestprice.Store
    belongs_to :product, Bestprice.Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(budget_item, attrs) do
    budget_item
    |> cast(attrs, [:price, :notes])
    |> validate_required([:price, :notes])
  end
end
