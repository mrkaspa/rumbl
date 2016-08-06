defmodule Rumbl.User do
  use Rumbl.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :videos, Rumbl.Video, on_delete: :delete_all
    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :username, :password])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
    |> unique_constraint(:username)
  end

  def registration_changeset(model, params \\ %{}) do
    model
    |> changeset(params)
    |> validate_length(:password, min: 6, max: 20)
    |> put_pass_hash
    |> validate_required([:password_hash])
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash,
          Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end
end
