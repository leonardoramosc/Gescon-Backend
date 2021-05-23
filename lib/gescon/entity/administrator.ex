defmodule Gescon.Entity.Administrator do
  use Ecto.Schema
  import Ecto.Changeset

  schema "administrators" do
    field :address, :string
    field :state, :string
    field :city, :string
    field :country, :string
    field :email, :string
    field :name, :string
    field :phone_1, :string
    field :phone_2, :string
    field :rif, :string

    belongs_to :user, Gescon.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(administrator, attrs) do
    administrator
    |> cast(attrs, [:name, :rif, :phone_1, :phone_2, :email, :country, :city, :address, :state, :user_id])
    |> validate_required([:name, :rif, :phone_1, :email, :country, :city, :address, :state, :user_id])
  end
end
