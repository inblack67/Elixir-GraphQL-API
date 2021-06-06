defmodule GqlWeb.Schema.Middlewares.Authorize do
  @behaviour Absinthe.Middleware
  def call(resolution, _role) do
    with %{current_user: _current_user} <- resolution.context do
      resolution
    else
      _ -> resolution |> Absinthe.Resolution.put_result({:error, "Not Authorized"})
    end
  end
end
