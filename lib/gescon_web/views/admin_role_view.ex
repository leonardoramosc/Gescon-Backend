defmodule GesconWeb.Admin.RoleView do
  use GesconWeb, :view

  def render("index.json", %{roles: roles}) do
    %{roles: render_many(roles, __MODULE__, "role.json")}
  end

  def render("show.json", %{role: role}) do
    render("role.json", %{role: role})
  end

  def render("role.json", %{role: role}) do
    %{
      id: role.id,
      title: role.title,
      inserted_at: role.inserted_at,
      updated_at: role.updated_at
    }
  end

end
