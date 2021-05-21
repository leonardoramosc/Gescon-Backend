defmodule Gescon.Repo.Migrations.CreateUserRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :title, :string

      timestamps()
    end

  end
end
