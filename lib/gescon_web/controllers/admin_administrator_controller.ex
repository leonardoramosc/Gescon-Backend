defmodule GesconWeb.Admin.AdministratorController do
  use GesconWeb, :controller

  alias Gescon.Entity

  def index(conn, _params) do
    administrators = Entity.list_administrators()

    render(conn, "index.json", administrators: administrators)
  end
end
