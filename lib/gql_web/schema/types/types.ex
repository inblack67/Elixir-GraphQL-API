defmodule GqlWeb.Schema.Types do
  use Absinthe.Schema.Notation
  alias GqlWeb.Schema.Types

  import_types(Types.UserType)
end
