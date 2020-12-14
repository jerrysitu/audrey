defmodule Audrey.Location.Property do
  use Ecto.Schema
  import Ecto.Changeset

  schema "properties" do
    field :street_address, :string
    field :apartment, :string
    field :city, :string
    field :state, :string
    field :country, :string
    field :zip, :string
    field :longitude, :float
    field :latitude, :float
    # TODO: MOVE THIS TO ANOTHER TABLE
    field :user_type, :string

    timestamps()
  end

  def changeset(property, attrs) do
    property
    |> cast(attrs, [
      :street_address,
      :apartment,
      :city,
      :state,
      :country,
      :user_type,
      :zip,
      :longitude,
      :latitude
    ])
  end
end
