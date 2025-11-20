defmodule BestpriceWeb.BudgetController do
  use BestpriceWeb, :controller

  alias Bestprice.Budgets

  def index(conn, _params) do
    budgets = Budgets.list_budgets()
    csrf_token = get_csrf_token()

    conn
    |> assign(:budgets, budgets)
    |> assign(:csrf_token, csrf_token)
    |> render(:index)
  end

  def show(conn, %{"slug" => slug}) do
    case Budgets.find_budget_by_slug(slug) do
      nil ->
        conn
        |> put_flash(:error, "Budget not found.")
        |> redirect(to: ~p"/budgets")

      budget ->
        conn
        |> assign(:budget, budget)
        |> render(:show)
    end
  end

  def create(conn, %{"name" => name, "description" => description}) do
    case Budgets.create_budget(%{"name" => name, "description" => description}) do
      {:ok, budget} ->
        conn
        |> put_flash(:info, "Budget created successfully.")
        |> redirect(to: ~p"/budgets/#{budget.slug}")

      {:error, _changeset} ->
        conn
        |> put_flash(:error, "Failed to create budget.")
        |> redirect(to: ~p"/budgets")
    end
  end

  def delete(conn, %{"id" => id}) do
    case Budgets.find_budget_by_id(String.to_integer(id)) do
      nil ->
        conn
        |> put_flash(:error, "Budget not found.")
        |> redirect(to: ~p"/budgets")

      budget ->
        case Budgets.delete_budget(budget) do
          {:ok, _} ->
            conn
            |> put_flash(:info, "Budget deleted successfully.")
            |> redirect(to: ~p"/budgets")

          {:error, _} ->
            conn
            |> put_flash(:error, "Failed to delete budget.")
            |> redirect(to: ~p"/budgets")
        end
    end
  end
end
