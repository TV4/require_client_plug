defmodule RequireClient do
  import Plug.Conn

  @default_options [error: "'client' parameter is missing"]

  def init(options), do: Keyword.merge(@default_options, options)

  def call(conn, options) do
    if conn.params["client"] do
      conn
    else
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(400, Poison.encode!(%{error: options[:error]}))
      |> halt
    end
  end
end
