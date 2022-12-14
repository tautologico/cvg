defmodule CvgWeb.PlataformaController do
  use CvgWeb, :controller

  alias Cvg.Videogame
  alias Cvg.Videogame.Plataforma

  def index(conn, _params) do
    plataformas = Videogame.list_plataformas()
    render(conn, "index.html", plataformas: plataformas)
  end

  def new(conn, _params) do
    changeset = Videogame.change_plataforma(%Plataforma{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"plataforma" => plataforma_params}) do
    case Videogame.create_plataforma(plataforma_params) do
      {:ok, plataforma} ->
        conn
        |> put_flash(:info, "Plataforma created successfully.")
        |> redirect(to: Routes.plataforma_path(conn, :show, plataforma))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    plataforma = Videogame.get_plataforma!(id)
    render(conn, "show.html", plataforma: plataforma)
  end

  def edit(conn, %{"id" => id}) do
    plataforma = Videogame.get_plataforma!(id)
    changeset = Videogame.change_plataforma(plataforma)
    render(conn, "edit.html", plataforma: plataforma, changeset: changeset)
  end

  def update(conn, %{"id" => id, "plataforma" => plataforma_params}) do
    plataforma = Videogame.get_plataforma!(id)

    case Videogame.update_plataforma(plataforma, plataforma_params) do
      {:ok, plataforma} ->
        conn
        |> put_flash(:info, "Plataforma updated successfully.")
        |> redirect(to: Routes.plataforma_path(conn, :show, plataforma))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", plataforma: plataforma, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    plataforma = Videogame.get_plataforma!(id)
    {:ok, _plataforma} = Videogame.delete_plataforma(plataforma)

    conn
    |> put_flash(:info, "Plataforma deleted successfully.")
    |> redirect(to: Routes.plataforma_path(conn, :index))
  end
end
