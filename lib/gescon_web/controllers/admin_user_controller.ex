defmodule GesconWeb.Admin.UserController do
  use GesconWeb, :controller

  alias Gescon.Accounts
  alias Gescon.Auth.Guardian
  alias Gescon.Accounts.User

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end
  def create(conn, %{"user" => user_params}) do
    with { :ok, %User{} = user } <- Accounts.create_user(user_params),
         { :ok, token, _claims } <- Guardian.encode_and_sign(user) do

      conn |> render("jwt.json", jwt: token)
    end
  end

end
