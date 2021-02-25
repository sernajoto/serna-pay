defmodule SernaPay do
  alias SernaPay.Users.Create, as: UserCreate
  alias SernaPay.Accounts.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
end
