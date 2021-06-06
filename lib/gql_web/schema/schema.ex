defmodule Gql.Schema do
  use Absinthe.Schema
  alias GqlWeb.Resolvers
  alias GqlWeb.Schema.Middlewares.Authorize

  import_types(GqlWeb.Schema.Types)

  query do
    @desc "Greet"
    field :hello, :string do
      resolve(fn _, _ -> {:ok, "hello wolds"} end)
    end

    @desc "Get all Users"
    field :users, list_of(:user_type) do
      middleware(Authorize, "user")
      resolve(&Resolvers.UsersResolver.users/3)
    end
  end

  mutation do
    @desc "Register a new User"
    field :register_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolvers.UsersResolver.register_user/3)
    end

    @desc "Login User"
    field :login_user, type: :login_user_type do
      arg(:input, non_null(:login_user_input_type))
      resolve(&Resolvers.UsersResolver.login_user/3)
    end
  end
end
