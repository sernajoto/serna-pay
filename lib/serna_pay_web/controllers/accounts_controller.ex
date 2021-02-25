defmodule SernaPayWeb.AccountsController do
  use SernaPayWeb, :controller

  alias SernaPay.Account
  alias SernaPay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback SernaPayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- SernaPay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- SernaPay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- SernaPay.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
