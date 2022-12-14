defmodule Cvg.Videogame.Plataforma do
  use Ecto.Schema
  import Ecto.Changeset

  schema "plataformas" do
    field :fabricante, :string
    field :lancamento, :string
    field :nome, :string

    timestamps()
  end

  @doc false
  def changeset(plataforma, attrs) do
    plataforma
    |> cast(attrs, [:nome, :fabricante, :lancamento])
    |> validate_required([:nome, :fabricante, :lancamento])
  end
end
