defmodule GqlWeb.Schema.Types.PostType do
  use Absinthe.Schema.Notation

  object :post_type do
    field(:id, :id)
    field(:user_id, :id)
    field(:title, :string)
    field(:content, :string)
    field(:published, :boolean)
  end

  input_object :post_input_type do
    field(:title, non_null(:string))
    field(:content, non_null(:string))
    field(:published, non_null(:boolean))
  end
end
