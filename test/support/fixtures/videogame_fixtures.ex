defmodule Cvg.VideogameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Cvg.Videogame` context.
  """

  @doc """
  Generate a plataforma.
  """
  def plataforma_fixture(attrs \\ %{}) do
    {:ok, plataforma} =
      attrs
      |> Enum.into(%{
        fabricante: "some fabricante",
        lancamento: "some lancamento",
        nome: "some nome"
      })
      |> Cvg.Videogame.create_plataforma()

    plataforma
  end

  @doc """
  Generate a jogo.
  """
  def jogo_fixture(attrs \\ %{}) do
    {:ok, jogo} =
      attrs
      |> Enum.into(%{
        empresa: "some empresa",
        lancamento: "some lancamento",
        titulo: "some titulo"
      })
      |> Cvg.Videogame.create_jogo()

    jogo
  end
end
