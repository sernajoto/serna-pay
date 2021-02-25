defmodule SernaPayWeb.AccountsController do
  use SernaPayWeb, :controller

  alias SernaPay.Account

  action_fallback SernaPayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- SernaPay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
end
