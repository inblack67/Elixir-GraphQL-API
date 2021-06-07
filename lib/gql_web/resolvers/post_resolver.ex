defmodule GqlWeb.Resolvers.PostResolver do
  alias Gql.Blog

  def posts(_, _, _) do
    {:ok, Blog.list_posts()}
  end

  def create_post(_, %{input: input}, %{context: %{current_user: current_user}}) do
    post_input = Map.merge(input, %{user_id: current_user.id})
    Blog.create_post(post_input)
  end
end
