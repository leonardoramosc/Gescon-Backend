defmodule Gescon.Auth.Authorization do
  import Plug.Conn

  # def init(default), do: default

  def init(opts) do
    Keyword.fetch!(opts, :allowed_roles)
  end

  def call(conn, allowed_roles) do
    is_authorized? = get_user_role(conn) in allowed_roles

    if is_authorized? do
      conn
    else
      conn
      |> send_resp(:unauthorized, "You don't have the requeried permissions")
      |> halt()
    end
  end

  defp get_user_role(conn) do
    conn
    |> Map.get(:private)
    |> Map.get(:guardian_default_resource)
    |> Map.get(:role_id)
  end

end
