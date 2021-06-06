defmodule GqlWeb.Schema.Types.UserType do
  use Absinthe.Schema.Notation

  object :user_type do
    field(:id, :id)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:password, :string)
  end

  input_object :user_input_type do
    field(:first_name, non_null(:string))
    field(:last_name, non_null(:string))
    field(:email, non_null(:string))
    field(:password, non_null(:string))
  end

  object :login_user_type do
    field(:token, non_null(:string))
    field(:user, non_null(:user_type))
  end

  input_object :login_user_input_type do
    field(:email, non_null(:string))
    field(:password, non_null(:string))
  end
end
