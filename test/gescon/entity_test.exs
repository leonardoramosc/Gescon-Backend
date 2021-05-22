defmodule Gescon.EntityTest do
  use Gescon.DataCase

  alias Gescon.Entity

  describe "administrators" do
    alias Gescon.Entity.Administrator

    @valid_attrs %{address: "some address", city: "some city", country: "some country", email: "some email", name: "some name", phone_1: "some phone_1", phone_2: "some phone_2", rif: "some rif"}
    @update_attrs %{address: "some updated address", city: "some updated city", country: "some updated country", email: "some updated email", name: "some updated name", phone_1: "some updated phone_1", phone_2: "some updated phone_2", rif: "some updated rif"}
    @invalid_attrs %{address: nil, city: nil, country: nil, email: nil, name: nil, phone_1: nil, phone_2: nil, rif: nil}

    def administrator_fixture(attrs \\ %{}) do
      {:ok, administrator} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Entity.create_administrator()

      administrator
    end

    test "list_administrators/0 returns all administrators" do
      administrator = administrator_fixture()
      assert Entity.list_administrators() == [administrator]
    end

    test "get_administrator!/1 returns the administrator with given id" do
      administrator = administrator_fixture()
      assert Entity.get_administrator!(administrator.id) == administrator
    end

    test "create_administrator/1 with valid data creates a administrator" do
      assert {:ok, %Administrator{} = administrator} = Entity.create_administrator(@valid_attrs)
      assert administrator.address == "some address"
      assert administrator.city == "some city"
      assert administrator.country == "some country"
      assert administrator.email == "some email"
      assert administrator.name == "some name"
      assert administrator.phone_1 == "some phone_1"
      assert administrator.phone_2 == "some phone_2"
      assert administrator.rif == "some rif"
    end

    test "create_administrator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entity.create_administrator(@invalid_attrs)
    end

    test "update_administrator/2 with valid data updates the administrator" do
      administrator = administrator_fixture()
      assert {:ok, %Administrator{} = administrator} = Entity.update_administrator(administrator, @update_attrs)
      assert administrator.address == "some updated address"
      assert administrator.city == "some updated city"
      assert administrator.country == "some updated country"
      assert administrator.email == "some updated email"
      assert administrator.name == "some updated name"
      assert administrator.phone_1 == "some updated phone_1"
      assert administrator.phone_2 == "some updated phone_2"
      assert administrator.rif == "some updated rif"
    end

    test "update_administrator/2 with invalid data returns error changeset" do
      administrator = administrator_fixture()
      assert {:error, %Ecto.Changeset{}} = Entity.update_administrator(administrator, @invalid_attrs)
      assert administrator == Entity.get_administrator!(administrator.id)
    end

    test "delete_administrator/1 deletes the administrator" do
      administrator = administrator_fixture()
      assert {:ok, %Administrator{}} = Entity.delete_administrator(administrator)
      assert_raise Ecto.NoResultsError, fn -> Entity.get_administrator!(administrator.id) end
    end

    test "change_administrator/1 returns a administrator changeset" do
      administrator = administrator_fixture()
      assert %Ecto.Changeset{} = Entity.change_administrator(administrator)
    end
  end
end
