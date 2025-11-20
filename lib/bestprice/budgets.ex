defmodule Bestprice.Budgets do
  alias Bestprice.Repo
  alias Bestprice.Budgets.Budget

  def list_budgets, do: Repo.all(Budget)

  def find_budget_by_slug(slug) when is_binary(slug), do: Repo.get_by(Budget, slug: slug)

  def find_budget_by_id(id) when is_integer(id), do: Repo.get(Budget, id)

  def slugfy(name) when is_binary(name) do
    name
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/u, "-")
    |> String.replace(~r/^-+|-+$/u, "")
  end

  def create_budget(attrs \\ %{}) do
    attrs =
      Map.put_new(attrs, "slug", slugfy(Map.get(attrs, "name", "")))

    %Budget{}
    |> Budget.changeset(attrs)
    |> Repo.insert()
  end

  def delete_budget(budget = %Budget{}) do
    Repo.delete(budget)
  end
end
