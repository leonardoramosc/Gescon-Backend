defmodule GesconWeb.Admin.RoleController do
  use GesconWeb, :controller

  alias Gescon.Accounts

  def index(conn, _params) do
    roles = Accounts.list_roles()

  end
end
