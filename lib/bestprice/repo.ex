defmodule Bestprice.Repo do
  use Ecto.Repo,
    otp_app: :bestprice,
    adapter: Ecto.Adapters.SQLite3
end
