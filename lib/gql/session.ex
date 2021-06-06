defmodule Gql.Auth.Session do
  alias Gql.Auth.User
  alias Gql.Repo

  def authenticate(args) do
    user = Repo.get_by(User, email: String.downcase(args.email))

    case(check_password(user, args)) do
      true -> {:ok, user}
      _ -> {:error, "Invalid Credentials"}
    end
  end

  defp check_password(user, args) do
    case user do
      nil -> false
      _ -> Argon2.verify_pass(args.password, user.password_hash)
    end
  end
end
