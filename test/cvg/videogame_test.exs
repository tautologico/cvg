defmodule Cvg.VideogameTest do
  use Cvg.DataCase

  alias Cvg.Videogame

  describe "plataformas" do
    alias Cvg.Videogame.Plataforma

    import Cvg.VideogameFixtures

    @invalid_attrs %{fabricante: nil, lancamento: nil, nome: nil}

    test "list_plataformas/0 returns all plataformas" do
      plataforma = plataforma_fixture()
      assert Videogame.list_plataformas() == [plataforma]
    end

    test "get_plataforma!/1 returns the plataforma with given id" do
      plataforma = plataforma_fixture()
      assert Videogame.get_plataforma!(plataforma.id) == plataforma
    end

    test "create_plataforma/1 with valid data creates a plataforma" do
      valid_attrs = %{fabricante: "some fabricante", lancamento: "some lancamento", nome: "some nome"}

      assert {:ok, %Plataforma{} = plataforma} = Videogame.create_plataforma(valid_attrs)
      assert plataforma.fabricante == "some fabricante"
      assert plataforma.lancamento == "some lancamento"
      assert plataforma.nome == "some nome"
    end

    test "create_plataforma/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Videogame.create_plataforma(@invalid_attrs)
    end

    test "update_plataforma/2 with valid data updates the plataforma" do
      plataforma = plataforma_fixture()
      update_attrs = %{fabricante: "some updated fabricante", lancamento: "some updated lancamento", nome: "some updated nome"}

      assert {:ok, %Plataforma{} = plataforma} = Videogame.update_plataforma(plataforma, update_attrs)
      assert plataforma.fabricante == "some updated fabricante"
      assert plataforma.lancamento == "some updated lancamento"
      assert plataforma.nome == "some updated nome"
    end

    test "update_plataforma/2 with invalid data returns error changeset" do
      plataforma = plataforma_fixture()
      assert {:error, %Ecto.Changeset{}} = Videogame.update_plataforma(plataforma, @invalid_attrs)
      assert plataforma == Videogame.get_plataforma!(plataforma.id)
    end

    test "delete_plataforma/1 deletes the plataforma" do
      plataforma = plataforma_fixture()
      assert {:ok, %Plataforma{}} = Videogame.delete_plataforma(plataforma)
      assert_raise Ecto.NoResultsError, fn -> Videogame.get_plataforma!(plataforma.id) end
    end

    test "change_plataforma/1 returns a plataforma changeset" do
      plataforma = plataforma_fixture()
      assert %Ecto.Changeset{} = Videogame.change_plataforma(plataforma)
    end
  end

  describe "jogos" do
    alias Cvg.Videogame.Jogo

    import Cvg.VideogameFixtures

    @invalid_attrs %{empresa: nil, lancamento: nil, titulo: nil}

    test "list_jogos/0 returns all jogos" do
      jogo = jogo_fixture()
      assert Videogame.list_jogos() == [jogo]
    end

    test "get_jogo!/1 returns the jogo with given id" do
      jogo = jogo_fixture()
      assert Videogame.get_jogo!(jogo.id) == jogo
    end

    test "create_jogo/1 with valid data creates a jogo" do
      valid_attrs = %{empresa: "some empresa", lancamento: "some lancamento", titulo: "some titulo"}

      assert {:ok, %Jogo{} = jogo} = Videogame.create_jogo(valid_attrs)
      assert jogo.empresa == "some empresa"
      assert jogo.lancamento == "some lancamento"
      assert jogo.titulo == "some titulo"
    end

    test "create_jogo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Videogame.create_jogo(@invalid_attrs)
    end

    test "update_jogo/2 with valid data updates the jogo" do
      jogo = jogo_fixture()
      update_attrs = %{empresa: "some updated empresa", lancamento: "some updated lancamento", titulo: "some updated titulo"}

      assert {:ok, %Jogo{} = jogo} = Videogame.update_jogo(jogo, update_attrs)
      assert jogo.empresa == "some updated empresa"
      assert jogo.lancamento == "some updated lancamento"
      assert jogo.titulo == "some updated titulo"
    end

    test "update_jogo/2 with invalid data returns error changeset" do
      jogo = jogo_fixture()
      assert {:error, %Ecto.Changeset{}} = Videogame.update_jogo(jogo, @invalid_attrs)
      assert jogo == Videogame.get_jogo!(jogo.id)
    end

    test "delete_jogo/1 deletes the jogo" do
      jogo = jogo_fixture()
      assert {:ok, %Jogo{}} = Videogame.delete_jogo(jogo)
      assert_raise Ecto.NoResultsError, fn -> Videogame.get_jogo!(jogo.id) end
    end

    test "change_jogo/1 returns a jogo changeset" do
      jogo = jogo_fixture()
      assert %Ecto.Changeset{} = Videogame.change_jogo(jogo)
    end
  end
end
