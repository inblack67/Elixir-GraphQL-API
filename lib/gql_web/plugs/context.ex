defmodule Gql.Plugs.Context do
  @behaviour Plug
  import Plug.Conn

  def init(options), do: options

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  defp build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, claims} <- Gql.Auth.Guardian.decode_and_verify(token),
         {:ok, user} <- Gql.Auth.Guardian.resource_from_claims(claims) do
      %{current_user: user}
    else
      _ -> %{}
    end
  end
end
