defmodule Audrey.Location.PropertyComment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "property_comments" do
    field :property_id, :integer
    field :comment, :string

    timestamps()
  end

  def changeset(property_comment, attrs) do
    property_comment
    |> cast(attrs, [
      :property_id,
      :comment
    ])
  end
end
