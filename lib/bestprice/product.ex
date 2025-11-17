defmodule Bestprice.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :category, :string

    has_many :budget_items, Bestprice.BudgetItem

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :category])
    |> validate_required([:name, :description, :category])
  end
end
