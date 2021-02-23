defmodule SernaPay.Users.Create do
  alias SernaPay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
