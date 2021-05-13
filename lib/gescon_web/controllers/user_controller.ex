defmodule GesconWeb.UserController do
  use GesconWeb, :controller

  alias Gescon.Accounts
  alias Gescon.Guardian
  alias Gescon.Accounts.User

  def create(conn, %{"user" => user_params}) do
    with { :ok, %User{} = user } <- Accounts.create_user(user_params),
         { :ok, token, _claims } <- Guardian.encode_and_sign(user) do

      conn |> render("jwt.json", jwt: token)
    end
  end

  def sign_in(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate(email, password) do
      {:ok, token, _claims} ->
        conn
        |> put_status(:ok)
        |> render("jwt.json", jwt: token)
      {:error, message} ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: message})
    end
  end
end
