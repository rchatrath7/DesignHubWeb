defmodule Pittdesignhub.Charter do
  use Pittdesignhub.Web, :model

  schema "charters" do
    field :title, :string
    field :author, :string
    field :version, :string

    has_many :questions, Pittdesignhub.Question
    belongs_to :team, Pittdesignhub.Team
    
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :author, :version])
    |> validate_required([:title, :author, :version])
  end
end
