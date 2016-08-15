defmodule Rumbl.Annotation do
  use Rumbl.Web, :model

  schema "annotations" do
    field :body, :string
    field :at, :integer
    belongs_to :user, Rumbl.User
    belongs_to :video, Rumbl.Video

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :at, :user_id, :video_id])
    |> validate_required([:body, :at])
    |> assoc_constraint(:video)
    |> assoc_constraint(:user)
  end
end
