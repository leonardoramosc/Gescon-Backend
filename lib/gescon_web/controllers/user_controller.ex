defmodule GesconWeb.UserController do
  use GesconWeb, :controller

  alias Gescon.Accounts

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
