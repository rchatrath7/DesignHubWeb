defmodule Pittdesignhub.Question do
  use Pittdesignhub.Web, :model

  schema "questions" do
    field :description, :string
    field :response, :string
    
    belongs_to :charter, Pittdesignhub.Charter
    has_many :comments, Pittdesignhub.Comment, foreign_key: :question_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description, :response, :charter_id])
    |> validate_required([:description, :response, :charter_id])
  end
end
