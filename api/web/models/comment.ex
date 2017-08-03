defmodule Pittdesignhub.Comment do
  use Pittdesignhub.Web, :model

  schema "comments" do
    field :author, :string
    field :resolved, :boolean, default: false
    field :comment, :string

    has_many :children, Pittdesignhub.Comment, foreign_key: :parent_id
    belongs_to :parent, Pittdesignhub.Comment, foreign_key: :parent_id

    timestamps()
  end

  @doc """
    Recursively load parents into the given struct
  """
  def load_parents(parent) do
    load_parents(parent, 10)
  end

  def load_parents(_, limit) when limit < 0, do: raise "Recursion limit reached"

  def load_parents(%Pittdesignhub.Comment{parent: %Ecto.Association.NotLoaded{}} = parent, limit) do
    parent = parent |> Pittdesignhub.Repo.preload(:parent)
    Map.update!(parent, :parent, &Pittdesignhub.Comment.load_parents(&1, limit - 1))
  end

  def load_parents(nil, _), do: nil

  @doc """
    Recursively loads children into the given struct
  """
  def load_children(model), do: load_children(model, 10)

  def load_children(_, limit) when limit < 0, do: raise "Recurison limit reached"

  def load_children(%Pittdesignhub.Comment{children: %Ecto.Association.NotLoaded{}} = model, limit) do
    model = model |> Pittdesignhub.Repo.preload(:children)
    Map.update!(model, :children, fn(list) ->
      Enum.map(list, &Pittdesignhub.Comment.load_children(&1, limit - 1))
    end)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:author, :resolved, :comment, :parent_id])
    |> validate_required([:author, :resolved, :comment])
  end
end
