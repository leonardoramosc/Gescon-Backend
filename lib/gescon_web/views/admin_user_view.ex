defmodule GesconWeb.Admin.UserView do
  use GesconWeb, :view

  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end

  def render("show.json", %{user: user}) do
    %{user: render_one(user, __MODULE__, "user.json")}
  end

  def render("user.json", %{user: user}) do
    IO.puts("+++++++++++++++++")
    IO.inspect(user.email)
    %{
      email: user.email
    }
  end
end
