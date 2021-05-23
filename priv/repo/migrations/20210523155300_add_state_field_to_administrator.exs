defmodule Gescon.Repo.Migrations.AddStateFieldToAdministrator do
  use Ecto.Migration

  def change do
    alter table(:administrators) do
      add :state, :string
    end
  end
end
