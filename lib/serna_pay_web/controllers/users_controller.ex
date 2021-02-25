defmodule SernaPayWeb.UsersController do
  use SernaPayWeb, :controller

  alias SernaPay.User

  action_fallback SernaPayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- SernaPay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
