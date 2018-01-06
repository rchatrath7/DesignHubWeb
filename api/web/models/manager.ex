defmodule Pittdesignhub.Manager do
  use Pittdesignhub.Web, :model

  schema "managers" do
    belongs_to :user, Pittdesignhub.User
    has_many :teams, Pittdesignhub.Team 

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
