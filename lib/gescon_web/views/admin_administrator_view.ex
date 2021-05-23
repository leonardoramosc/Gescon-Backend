defmodule GesconWeb.Admin.AdministratorView do
  use GesconWeb, :view

  def render("index.json", %{administrators: administrators}) do
    %{administrators: render_many(administrators, __MODULE__, "administrator.json")}
  end

  def render("show.json", %{administrator: admin}) do
    render("administrator.json", %{administrator: admin})
  end

  def render("administrator.json", %{administrator: admin}) do
    %{
      address: admin.address,
      city: admin.city,
      country: admin.country,
      email: admin.email,
      name: admin.name,
      phone_1: admin.phone_1,
      phone_2: admin.phone_2,
      rif: admin.rif,
      user_id: admin.user_id
    }
  end
end
