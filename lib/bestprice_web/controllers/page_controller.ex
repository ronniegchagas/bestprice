defmodule BestpriceWeb.PageController do
  use BestpriceWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
