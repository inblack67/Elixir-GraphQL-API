defmodule Gql.Plugs.Context do
  @behaviour Plug
  import Plug.Conn

  def init(options), do: options

  def call(ctx, _) do
    context = populate_current_user(ctx)
    new_ctx = Absinthe.Plug.put_options(ctx, context: context)
    new_ctx
  end

  defp populate_current_user(ctx) do
    with ["Bearer " <> token] <- get_req_header(ctx, "authorization"),
         {:ok, claims} <- Gql.Auth.Guardian.decode_and_verify(token),
         {:ok, user} <- Gql.Auth.Guardian.resource_from_claims(claims) do
      %{current_user: user}
    else
      _ -> %{}
    end
  end
end
