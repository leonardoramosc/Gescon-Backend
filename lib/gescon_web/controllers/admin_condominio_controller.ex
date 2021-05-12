defmodule GesconWeb.Admin.CondominioController do
  use GesconWeb, :controller

  def index(conn, _params) do
    condominios = [
      %{name: "terrazas"},
      %{name: "guadalupe"}
    ]
    render(conn, "index.json", condominios: condominios)
  end

end
