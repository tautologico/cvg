defmodule Cvg.Videogame.Jogo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jogos" do
    field :empresa, :string
    field :lancamento, :string
    field :titulo, :string
    field :plataforma_id, :id

    timestamps()
  end

  @doc false
  def changeset(jogo, attrs) do
    jogo
    |> cast(attrs, [:titulo, :empresa, :lancamento, :plataforma_id])
    |> validate_required([:titulo, :empresa, :lancamento, :plataforma_id])
  end
end
