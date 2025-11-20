defmodule BestpriceWeb.BudgetHTML do
  use BestpriceWeb, :html
  alias Bestprice.Budgets.Budget

  embed_templates "budget_html/*"

  attr :budget, Budget, required: true

  def budget(assigns) do
    ~H"""
    <div class="flex items-center justify-between py-2 border-b">
      <.link href={~p"/budgets/#{@budget.slug}"} class="block w-max">
        {@budget.id} - {@budget.name} - {@budget.description}
      </.link>
      <.link
        href={~p"/budgets/#{@budget.id}"}
        method="delete"
        data-confirm="Are you sure you want to delete this budget?"
        class="ml-4 text-sm font-semibold leading-6 text-red-600 hover:text-red-500"
      >
        Delete
      </.link>
    </div>
    """
  end

  def back(assigns) do
    ~H"""
    <div class="mt-8">
      <.link
        navigate={@navigate}
        class="text-sm font-semibold leading-6 text-zinc-900 hover:text-zinc-700"
      >
        <.icon name="hero-arrow-left-solid" class="h-3 w-3" /> {render_slot(@inner_block)}
      </.link>
    </div>
    """
  end
end
