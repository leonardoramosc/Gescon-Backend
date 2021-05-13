defmodule GesconWeb.Admin.UserController do
  use GesconWeb, :controller

  alias Gescon.Accounts
  alias Gescon.Guardian
  alias Gescon.Accounts.User

  def create(conn, %{"email" => email} = user_params) do

    user = Accounts.get_user_by_email(email)



    if user == nil do
      with { :ok, %User{} = user } <- Accounts.create_user(user_params),
         { :ok, token, _claims } <- Guardian.encode_and_sign(user) do

        conn |> render("jwt.json", jwt: token)
      end
    end

    render(conn, "show.json", user: user)
  end
end
