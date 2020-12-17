defmodule Audrey.Location.Property do
  use Ecto.Schema
  import Ecto.Changeset

  schema "properties" do
    field :apartment, :string
    field :street_number, :string
    field :street_number_short, :string
    field :route, :string
    field :route_short, :string
    field :neighborhood, :string
    field :neighborhood_short, :string
    field :locality, :string
    field :locality_short, :string
    field :administrative_area_level_2, :string
    field :administrative_area_level_2_short, :string
    field :administrative_area_level_1, :string
    field :administrative_area_level_1_short, :string
    field :country, :string
    field :country_short, :string
    field :postal_code, :string
    field :postal_code_short, :string
    field :longitude, :float
    field :latitude, :float
    field :user_type, :string

    timestamps()
  end

  def changeset(property, attrs) do
    property
    |> cast(attrs, [
      :apartment,
      :street_number,
      :street_number_short,
      :route,
      :route_short,
      :neighborhood,
      :neighborhood_short,
      :locality,
      :locality_short,
      :administrative_area_level_2,
      :administrative_area_level_2_short,
      :administrative_area_level_1,
      :administrative_area_level_1_short,
      :country,
      :country_short,
      :postal_code,
      :postal_code_short,
      :longitude,
      :latitude,
      :user_type
    ])
  end
end
