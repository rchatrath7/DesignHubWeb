defmodule Pittdesignhub.Designer do
  use Pittdesignhub.Web, :model

  schema "designers" do
    field :class, :string
    field :graduation_year, :integer
    field :major, :string
    field :minor, :string
    field :is_team_lead, :boolean
    belongs_to :user, Pittdesignhub.User
    belongs_to :teams, Pittdesignhub.Team

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:class, :graduation_year, :major, :minor, :is_team_lead])
    |> validate_required([:class, :graduation_year, :major, :minor, :is_team_lead])
  end
end
