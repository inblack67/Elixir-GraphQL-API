defmodule Gql.Plugs.Context do
  @behaviour Plug
  import Plug.Conn

  def init(options), do: options

  def call(ctx, _) do
    context = populate_current_user(ctx)
    new_ctx = Absinthe.Plug.put_options(ctx, context: context)
    new_ctx
    # ctx_with_dataloder = populate_dataloder(new_ctx)
    # IO.puts("creating ctx => ")
    # IO.inspect(ctx_with_dataloder)
    # ctx_with_dataloder
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

  # defp populate_dataloder(ctx) do
  #   source = Dataloader.Ecto.new(Gql.Repo)

  #   # setup the loader
  #   loader = Dataloader.new() |> Dataloader.add_source(:db, source)
  #   Map.put(ctx, :loader, loader)
  # end
end
