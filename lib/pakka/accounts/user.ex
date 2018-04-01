defmodule Pakka.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
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
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @required_fields ~w(username email password gender birth)
  @optional_fields ~w()

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields, @optional_fields)
    |> validate_required([:username, :email, :gender, :birth])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 6)
    |> validate_confirmation(:password)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> validate_length(:username, min: 5)
  end


    # Check if input credentials for login is okay
    def check_login(user, attrs) do
      user
      |> cast(attrs, [:username, :password])
      |> validate_required([:username, :password])
      |> validate_length(:pass, min: 6)
    end
end
