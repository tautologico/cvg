defmodule Cvg.Repo.Migrations.CreatePlataformas do
  use Ecto.Migration

  def change do
    create table(:plataformas) do
      add :nome, :string
      add :fabricante, :string
      add :lancamento, :string

      timestamps()
    end
  end
end
