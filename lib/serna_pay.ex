defmodule SernaPay do
  alias SernaPay.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end