defmodule Bestprice.Store do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stores" do
    field :name, :string
    field :address, :string
    field :zip_code, :string
    field :phone, :string

    has_many :budget_items, Bestprice.BudgetItem

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:name, :address, :zip_code, :phone])
    |> validate_required([:name, :address, :zip_code, :phone])
  end
end
