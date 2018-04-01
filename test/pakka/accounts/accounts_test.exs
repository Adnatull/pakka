defmodule Pakka.AccountsTest do
  use Pakka.DataCase

  alias Pakka.Accounts

  describe "admins" do
    alias Pakka.Accounts.Admin

    @valid_attrs %{address: "some address", birth: ~D[2010-04-17], country: "some country", email: "some email", firstname: "some firstname", gender: "some gender", lastname: "some lastname", mobile: "some mobile", nationalID: "some nationalID", password: "some password", postal: "some postal", profession: "some profession", profilepic: "some profilepic", username: "some username"}
    @update_attrs %{address: "some updated address", birth: ~D[2011-05-18], country: "some updated country", email: "some updated email", firstname: "some updated firstname", gender: "some updated gender", lastname: "some updated lastname", mobile: "some updated mobile", nationalID: "some updated nationalID", password: "some updated password", postal: "some updated postal", profession: "some updated profession", profilepic: "some updated profilepic", username: "some updated username"}
    @invalid_attrs %{address: nil, birth: nil, country: nil, email: nil, firstname: nil, gender: nil, lastname: nil, mobile: nil, nationalID: nil, password: nil, postal: nil, profession: nil, profilepic: nil, username: nil}

    def admin_fixture(attrs \\ %{}) do
      {:ok, admin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_admin()

      admin
    end

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Accounts.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Accounts.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      assert {:ok, %Admin{} = admin} = Accounts.create_admin(@valid_attrs)
      assert admin.address == "some address"
      assert admin.birth == ~D[2010-04-17]
      assert admin.country == "some country"
      assert admin.email == "some email"
      assert admin.firstname == "some firstname"
      assert admin.gender == "some gender"
      assert admin.lastname == "some lastname"
      assert admin.mobile == "some mobile"
      assert admin.nationalID == "some nationalID"
      assert admin.password == "some password"
      assert admin.postal == "some postal"
      assert admin.profession == "some profession"
      assert admin.profilepic == "some profilepic"
      assert admin.username == "some username"
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      assert {:ok, admin} = Accounts.update_admin(admin, @update_attrs)
      assert %Admin{} = admin
      assert admin.address == "some updated address"
      assert admin.birth == ~D[2011-05-18]
      assert admin.country == "some updated country"
      assert admin.email == "some updated email"
      assert admin.firstname == "some updated firstname"
      assert admin.gender == "some updated gender"
      assert admin.lastname == "some updated lastname"
      assert admin.mobile == "some updated mobile"
      assert admin.nationalID == "some updated nationalID"
      assert admin.password == "some updated password"
      assert admin.postal == "some updated postal"
      assert admin.profession == "some updated profession"
      assert admin.profilepic == "some updated profilepic"
      assert admin.username == "some updated username"
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_admin(admin, @invalid_attrs)
      assert admin == Accounts.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Accounts.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Accounts.change_admin(admin)
    end
  end
end
