defmodule GqlWeb.Schema.Types.PostType do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]
  alias Gql.Auth.User

  object :post_type do
    field(:id, :id)
    field(:user_id, :id)
    field(:title, :string)
    field(:content, :string)
    field(:published, :boolean)

    field :user, :user_type do
      resolve(dataloader(User))
      description("Who created me?")
    end
  end

  input_object :post_input_type do
    field(:title, non_null(:string))
    field(:content, non_null(:string))
    field(:published, non_null(:boolean))
  end
end
