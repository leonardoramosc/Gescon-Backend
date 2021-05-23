defmodule GesconWeb.Admin.UserView do
  use GesconWeb, :view

  alias GesconWeb.Admin.RoleView

  def render("index.json", %{users: users}) do
    %{users: render_many(users, __MODULE__, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{user: render_one(user, __MODULE__, "user.json")}
  end

  def render("user.json", %{user: user}) do
    IO.inspect(user.role)
    %{
      id: user.id,
      email: user.email,
      role: (
        if Ecto.assoc_loaded?(user.role), do: render_one(user.role, RoleView, "role.json"), else: nil
      )
      # documents: (if Ecto.assoc_loaded?(user.documents), do: render_many(user.documents, DocumentView, "document.json"), else: nil),
    }
  end

  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end

end
