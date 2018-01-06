defmodule Pittdesignhub.Team do
  use Pittdesignhub.Web, :model

  schema "teams" do
    field :name, :string
    field :is_active, :boolean, default: false

    belongs_to :manager, Pittdesignhub.Manager
    has_many :designers, Pittdesignhub.Designer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :is_active])
    |> validate_required([:name, :is_active])
  end
end
