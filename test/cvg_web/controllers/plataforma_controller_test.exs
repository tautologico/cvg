defmodule CvgWeb.PlataformaControllerTest do
  use CvgWeb.ConnCase

  import Cvg.VideogameFixtures

  @create_attrs %{fabricante: "some fabricante", lancamento: "some lancamento", nome: "some nome"}
  @update_attrs %{fabricante: "some updated fabricante", lancamento: "some updated lancamento", nome: "some updated nome"}
  @invalid_attrs %{fabricante: nil, lancamento: nil, nome: nil}

  describe "index" do
    test "lists all plataformas", %{conn: conn} do
      conn = get(conn, Routes.plataforma_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Plataformas"
    end
  end

  describe "new plataforma" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.plataforma_path(conn, :new))
      assert html_response(conn, 200) =~ "New Plataforma"
    end
  end

  describe "create plataforma" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.plataforma_path(conn, :create), plataforma: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.plataforma_path(conn, :show, id)

      conn = get(conn, Routes.plataforma_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Plataforma"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.plataforma_path(conn, :create), plataforma: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Plataforma"
    end
  end

  describe "edit plataforma" do
    setup [:create_plataforma]

    test "renders form for editing chosen plataforma", %{conn: conn, plataforma: plataforma} do
      conn = get(conn, Routes.plataforma_path(conn, :edit, plataforma))
      assert html_response(conn, 200) =~ "Edit Plataforma"
    end
  end

  describe "update plataforma" do
    setup [:create_plataforma]

    test "redirects when data is valid", %{conn: conn, plataforma: plataforma} do
      conn = put(conn, Routes.plataforma_path(conn, :update, plataforma), plataforma: @update_attrs)
      assert redirected_to(conn) == Routes.plataforma_path(conn, :show, plataforma)

      conn = get(conn, Routes.plataforma_path(conn, :show, plataforma))
      assert html_response(conn, 200) =~ "some updated fabricante"
    end

    test "renders errors when data is invalid", %{conn: conn, plataforma: plataforma} do
      conn = put(conn, Routes.plataforma_path(conn, :update, plataforma), plataforma: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Plataforma"
    end
  end

  describe "delete plataforma" do
    setup [:create_plataforma]

    test "deletes chosen plataforma", %{conn: conn, plataforma: plataforma} do
      conn = delete(conn, Routes.plataforma_path(conn, :delete, plataforma))
      assert redirected_to(conn) == Routes.plataforma_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.plataforma_path(conn, :show, plataforma))
      end
    end
  end

  defp create_plataforma(_) do
    plataforma = plataforma_fixture()
    %{plataforma: plataforma}
  end
end
