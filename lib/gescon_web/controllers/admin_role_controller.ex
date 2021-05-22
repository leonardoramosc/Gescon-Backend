defmodule GesconWeb.Admin.RoleController do
  use GesconWeb, :controller

  alias Gescon.Accounts

  def index(conn, _params) do
    roles = Accounts.list_roles()
    render(conn, "index.json", roles: roles)
  end

  def create(conn, role_params) do
    {:ok, role} = Accounts.create_role(role_params)

    conn
    |> put_status(:created)
    |> render("show.json", role: role)
  end

  def show(conn, %{"id" => id}) do
    role = Accounts.get_role!(id)
    render(conn, "show.json", role: role)
  end

  def update(conn, %{"id" => id, "role" => role_params}) do
    role = Accounts.get_role!(id)

    with {:ok, %Accounts.Role{} = role} <- Accounts.update_role(role, role_params) do
      render(conn, "show.json", role: role)
    end
  end

  def delete(conn, %{"id" => id}) do
    role = Accounts.get_role!(id)

    with {:ok, %Accounts.Role{}} <- Accounts.delete_role(role) do
      send_resp(conn, :no_content, "")
    end
  end
end
