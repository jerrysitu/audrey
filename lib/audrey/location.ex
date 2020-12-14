defmodule Audrey.Location do
  import Ecto.Query, warn: false
  alias Audrey.Repo
  alias Audrey.Location.{Property, PropertyComment}

  def list_properties do
    Property
    |> Repo.all()
  end

  def get_property!(id), do: Repo.get!(Property, id)

  def create_property(attrs \\ %{}) do
    %Property{}
    |> Property.changeset(attrs)
    |> Repo.insert()
  end

  def update_property(%Property{} = property, attrs) do
    property
    |> Property.changeset(attrs)
    |> Repo.update()
  end

  def list_property_comments do
    PropertyComment
    |> Repo.all()
  end

  def list_property_comments_by_property_id(property_id) do
    PropertyComment
    |> where([p], p.property_id == ^property_id)
    |> order_by(desc: :inserted_at)
    |> Repo.all()
  end

  def get_property_comment!(id), do: Repo.get!(PropertyComment, id)

  def create_property_comment(attrs \\ %{}) do
    %PropertyComment{}
    |> PropertyComment.changeset(attrs)
    |> Repo.insert()
  end

  def update_property_comment(%PropertyComment{} = property_comment, attrs) do
    property_comment
    |> PropertyComment.changeset(attrs)
    |> Repo.update()
  end
end
