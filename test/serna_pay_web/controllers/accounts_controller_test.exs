defmodule SernaPayWeb.AccountsControllerTest do
  use SernaPayWeb.ConnCase, async: true

  alias SernaPay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Guilherme",
        password: "123456",
        nickname: "serna",
        email: "serna@test.com",
        age: 18
      }

      {:ok, %User{account: %Account{id: account_id}}} = SernaPay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic c2VybmFqb3RvOjEyMzQ1Ng==")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
               "account" => %{"balance" => "50.00", "id" => _id},
               "message" => "Ballance changed successfully"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "no"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid deposit value!"}

      assert response == expected_response
    end
  end
end
