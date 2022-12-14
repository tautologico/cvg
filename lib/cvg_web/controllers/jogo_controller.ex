defmodule CvgWeb.JogoController do
  use CvgWeb, :controller

  alias Cvg.Videogame
  alias Cvg.Videogame.Jogo

  def index(conn, _params) do
    jogos = Videogame.list_jogos()
    render(conn, "index.html", jogos: jogos)
  end

  def new(conn, _params) do
    changeset = Videogame.change_jogo(%Jogo{})
    plataformas = Videogame.list_plataformas()
    render(conn, "new.html", changeset: changeset, plataformas: plataformas)
  end

  def create(conn, %{"jogo" => jogo_params}) do
    case Videogame.create_jogo(jogo_params) do
      {:ok, jogo} ->
        conn
        |> put_flash(:info, "Jogo created successfully.")
        |> redirect(to: Routes.jogo_path(conn, :show, jogo))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    jogo = Videogame.get_jogo!(id)
    render(conn, "show.html", jogo: jogo)
  end

  def edit(conn, %{"id" => id}) do
    jogo = Videogame.get_jogo!(id)
    changeset = Videogame.change_jogo(jogo)
    render(conn, "edit.html", jogo: jogo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "jogo" => jogo_params}) do
    jogo = Videogame.get_jogo!(id)

    case Videogame.update_jogo(jogo, jogo_params) do
      {:ok, jogo} ->
        conn
        |> put_flash(:info, "Jogo updated successfully.")
        |> redirect(to: Routes.jogo_path(conn, :show, jogo))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", jogo: jogo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    jogo = Videogame.get_jogo!(id)
    {:ok, _jogo} = Videogame.delete_jogo(jogo)

    conn
    |> put_flash(:info, "Jogo deleted successfully.")
    |> redirect(to: Routes.jogo_path(conn, :index))
  end
end
