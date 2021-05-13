defmodule GesconWeb.UserView do
  use GesconWeb, :view

  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end
end
