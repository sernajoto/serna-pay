defmodule SernaPayWeb.UsersViewTest do
  use SernaPayWeb.ConnCase, async: true

  import Phoenix.View

  alias SernaPay.{Account, User}
  alias SernaPayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Guilherme",
      password: "123456",
      nickname: "serna",
      email: "serna@test.com",
      age: 24
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      SernaPay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{balance: Decimal.new("0.00"), id: account_id},
        id: user_id,
        name: "Guilherme",
        nickname: "serna"
      }
    }

    assert expected_response == response
  end
end
