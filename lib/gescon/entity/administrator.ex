defmodule Gescon.Entity.Administrator do
  use Ecto.Schema
  import Ecto.Changeset

  schema "administrators" do
    field :address, :string
    field :city, :string
    field :country, :string
    field :email, :string
    field :name, :string
    field :phone_1, :string
    field :phone_2, :string
    field :rif, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(administrator, attrs) do
    administrator
    |> cast(attrs, [:name, :rif, :phone_1, :phone_2, :email, :country, :city, :address, :user_id])
    |> validate_required([:name, :rif, :phone_1, :email, :country, :city, :address, :user_id])
  end
end