defmodule Gescon.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false

  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    belongs_to :role, Gescon.Accounts.Role
    has_one :administrator, Gescon.Entity.Administrator
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :role_id])
    |> validate_required([:email, :password])
    |> validate_length(:password, min: 6)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{ valid?: true, changes: %{password: pass} } ->
        put_change(changeset, :password_hash, hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
