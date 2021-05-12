defmodule GesconWeb.Admin.CondominioView do
  use GesconWeb, :view

  def render("index.json", %{condominios: condominios}) do
    %{condominios: render_many(condominios, __MODULE__, "condominio.json")}
  end

  def render("condominio.json", %{condominio: condominio}) do
    %{name: condominio.name}
  end

end
