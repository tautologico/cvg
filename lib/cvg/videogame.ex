defmodule Cvg.Videogame do
  @moduledoc """
  The Videogame context.
  """

  import Ecto.Query, warn: false
  alias Cvg.Repo

  alias Cvg.Videogame.Plataforma

  @doc """
  Returns the list of plataformas.

  ## Examples

      iex> list_plataformas()
      [%Plataforma{}, ...]

  """
  def list_plataformas do
    Repo.all(Plataforma)
  end

  @doc """
  Gets a single plataforma.

  Raises `Ecto.NoResultsError` if the Plataforma does not exist.

  ## Examples

      iex> get_plataforma!(123)
      %Plataforma{}

      iex> get_plataforma!(456)
      ** (Ecto.NoResultsError)

  """
  def get_plataforma!(id), do: Repo.get!(Plataforma, id)

  @doc """
  Creates a plataforma.

  ## Examples

      iex> create_plataforma(%{field: value})
      {:ok, %Plataforma{}}

      iex> create_plataforma(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_plataforma(attrs \\ %{}) do
    %Plataforma{}
    |> Plataforma.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a plataforma.

  ## Examples

      iex> update_plataforma(plataforma, %{field: new_value})
      {:ok, %Plataforma{}}

      iex> update_plataforma(plataforma, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_plataforma(%Plataforma{} = plataforma, attrs) do
    plataforma
    |> Plataforma.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a plataforma.

  ## Examples

      iex> delete_plataforma(plataforma)
      {:ok, %Plataforma{}}

      iex> delete_plataforma(plataforma)
      {:error, %Ecto.Changeset{}}

  """
  def delete_plataforma(%Plataforma{} = plataforma) do
    Repo.delete(plataforma)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking plataforma changes.

  ## Examples

      iex> change_plataforma(plataforma)
      %Ecto.Changeset{data: %Plataforma{}}

  """
  def change_plataforma(%Plataforma{} = plataforma, attrs \\ %{}) do
    Plataforma.changeset(plataforma, attrs)
  end

  alias Cvg.Videogame.Jogo

  @doc """
  Returns the list of jogos.

  ## Examples

      iex> list_jogos()
      [%Jogo{}, ...]

  """
  def list_jogos do
    Repo.all(Jogo)
  end

  @doc """
  Gets a single jogo.

  Raises `Ecto.NoResultsError` if the Jogo does not exist.

  ## Examples

      iex> get_jogo!(123)
      %Jogo{}

      iex> get_jogo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_jogo!(id), do: Repo.get!(Jogo, id)

  @doc """
  Creates a jogo.

  ## Examples

      iex> create_jogo(%{field: value})
      {:ok, %Jogo{}}

      iex> create_jogo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_jogo(attrs \\ %{}) do
    %Jogo{}
    |> Jogo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a jogo.

  ## Examples

      iex> update_jogo(jogo, %{field: new_value})
      {:ok, %Jogo{}}

      iex> update_jogo(jogo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_jogo(%Jogo{} = jogo, attrs) do
    jogo
    |> Jogo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a jogo.

  ## Examples

      iex> delete_jogo(jogo)
      {:ok, %Jogo{}}

      iex> delete_jogo(jogo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_jogo(%Jogo{} = jogo) do
    Repo.delete(jogo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking jogo changes.

  ## Examples

      iex> change_jogo(jogo)
      %Ecto.Changeset{data: %Jogo{}}

  """
  def change_jogo(%Jogo{} = jogo, attrs \\ %{}) do
    Jogo.changeset(jogo, attrs)
  end
end
