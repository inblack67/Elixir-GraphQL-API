defmodule GqlWeb.Schema.Types.UserType do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias Gql.Blog

  object :user_type do
    field(:id, :id)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:password, :string)

    field :posts, list_of(:post_type) do
      resolve(dataloader(Blog))
      description("Get my Posts")
    end
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
