defmodule CvgWeb.JogoControllerTest do
  use CvgWeb.ConnCase

  import Cvg.VideogameFixtures

  @create_attrs %{empresa: "some empresa", lancamento: "some lancamento", titulo: "some titulo"}
  @update_attrs %{empresa: "some updated empresa", lancamento: "some updated lancamento", titulo: "some updated titulo"}
  @invalid_attrs %{empresa: nil, lancamento: nil, titulo: nil}

  describe "index" do
    test "lists all jogos", %{conn: conn} do
      conn = get(conn, Routes.jogo_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Jogos"
    end
  end

  describe "new jogo" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.jogo_path(conn, :new))
      assert html_response(conn, 200) =~ "New Jogo"
    end
  end

  describe "create jogo" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.jogo_path(conn, :create), jogo: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.jogo_path(conn, :show, id)

      conn = get(conn, Routes.jogo_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Jogo"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.jogo_path(conn, :create), jogo: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Jogo"
    end
  end

  describe "edit jogo" do
    setup [:create_jogo]

    test "renders form for editing chosen jogo", %{conn: conn, jogo: jogo} do
      conn = get(conn, Routes.jogo_path(conn, :edit, jogo))
      assert html_response(conn, 200) =~ "Edit Jogo"
    end
  end

  describe "update jogo" do
    setup [:create_jogo]

    test "redirects when data is valid", %{conn: conn, jogo: jogo} do
      conn = put(conn, Routes.jogo_path(conn, :update, jogo), jogo: @update_attrs)
      assert redirected_to(conn) == Routes.jogo_path(conn, :show, jogo)

      conn = get(conn, Routes.jogo_path(conn, :show, jogo))
      assert html_response(conn, 200) =~ "some updated empresa"
    end

    test "renders errors when data is invalid", %{conn: conn, jogo: jogo} do
      conn = put(conn, Routes.jogo_path(conn, :update, jogo), jogo: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Jogo"
    end
  end

  describe "delete jogo" do
    setup [:create_jogo]

    test "deletes chosen jogo", %{conn: conn, jogo: jogo} do
      conn = delete(conn, Routes.jogo_path(conn, :delete, jogo))
      assert redirected_to(conn) == Routes.jogo_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.jogo_path(conn, :show, jogo))
      end
    end
  end

  defp create_jogo(_) do
    jogo = jogo_fixture()
    %{jogo: jogo}
  end
end
