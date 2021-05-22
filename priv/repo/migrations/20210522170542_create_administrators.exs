defmodule Gescon.Repo.Migrations.CreateAdministrators do
  use Ecto.Migration

  def change do
    create table(:administrators) do
      add :name, :string
      add :rif, :string
      add :phone_1, :string
      add :phone_2, :string
      add :email, :string
      add :country, :string
      add :city, :string
      add :address, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:administrators, [:user_id])
  end
end
