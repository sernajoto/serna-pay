defmodule SernaPayWeb.FallbackController do
  use SernaPayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(SernaPayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
