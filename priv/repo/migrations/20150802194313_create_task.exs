defmodule MyApp_802337.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :due_at, :datetime

      timestamps
    end

  end
end
