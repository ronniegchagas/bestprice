defmodule Bestprice.Budgets.Budget do
  use Ecto.Schema
  import Ecto.Changeset

  schema "budgets" do
    field :name, :string
    field :description, :string
    field :slug, :string

    has_many :budget_items, Bestprice.BudgetItem

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(budget, attrs) do
    budget
    |> cast(attrs, [:name, :description, :slug])
    |> validate_required([:name, :description, :slug])
    |> generate_slug()
    |> validate_format(:slug, ~r/^[a-z0-9-]+$/)
    |> unique_constraint(:slug)
  end

  defp generate_slug(changeset) do
    slug =
      changeset.changes.name
      |> String.downcase()
      |> String.replace(" ", "-")

    put_change(changeset, :slug, slug)
  end
end
