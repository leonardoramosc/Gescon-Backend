defmodule GesconWeb.Admin.AdministratorController do
  use GesconWeb, :controller

  alias Gescon.Entity

  def index(conn, _params) do
    administrators = Entity.list_administrators()

    render(conn, "index.json", administrators: administrators)
  end

  def show(conn, %{"id" => id}) do
    admin = Entity.get_administrator!(id)

    render(conn, "show.json", administrator: admin)
  end

  def create(conn, params) do
    {:ok, administrator} = Entity.create_administrator(params)

    conn
    |> put_status(:created)
    |> render("show.json", administrator: administrator)
  end
end
