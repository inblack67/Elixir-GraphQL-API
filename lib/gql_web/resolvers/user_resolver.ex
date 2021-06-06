defmodule GqlWeb.Resolvers.UsersResolver do
  alias Gql.Auth
  alias Gql.Auth.{Session, Guardian}

  def users(_, _, _) do
    {:ok, Auth.list_users()}
  end

  def register_user(_, %{input: input}, _) do
    Auth.create_user(input)
  end

  def login_user(_, %{input: input}, _) do
    # left to right => with block

    with {:ok, user} <- Session.authenticate(input),
         {:ok, jwt_token, _} <- Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt_token, user: user}}
    end
  end
end
