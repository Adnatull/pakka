defmodule Pakka.Accounts.Admin do
  use Ecto.Schema
  import Ecto.Changeset


  schema "admins" do
    field :address, :string
    field :birth, :date
    field :country, :string
    field :email, :string
    field :firstname, :string
    field :gender, :string
    field :lastname, :string
    field :mobile, :string
    field :nationalID, :string
    field :password, :string
    field :postal, :string
    field :profession, :string
    field :profilepic, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:username, :email, :password, :firstname, :lastname, :gender, :birth, :mobile, :address, :postal, :country, :profilepic, :profession, :nationalID])
    |> validate_required([:username, :email, :password, :firstname, :lastname, :gender, :birth, :mobile, :address, :postal, :country, :profilepic, :profession, :nationalID])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end
