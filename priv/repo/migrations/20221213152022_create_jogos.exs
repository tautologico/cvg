defmodule Cvg.Repo.Migrations.CreateJogos do
  use Ecto.Migration

  def change do
    create table(:jogos) do
      add :titulo, :string
      add :empresa, :string
      add :lancamento, :string
      add :plataforma_id, references(:plataformas, on_delete: :nothing)

      timestamps()
    end

    create index(:jogos, [:plataforma_id])
  end
end
