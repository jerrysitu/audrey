defmodule Audrey.Location.Property do
  use Ecto.Schema
  import Ecto.Changeset

  @amenities [
    :wifi,
    :bathtub,
    :shower,
    :ethernet_connection,
    :smoke_alarms,
    :oven,
    :stove,
    :microwave,
    :dish_washer,
    :refrigerator,
    :patio_or_balcony,
    :backyard,
    :gym,
    :pool,
    :furnished,
    :smoking,
    :ev_charging,
    :dogs_ok,
    :cats_ok,
    :wheelchair_accessible
  ]

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
    field :administrative_area_level_1, :string
    field :administrative_area_level_1_short, :string
    field :administrative_area_level_2, :string
    field :administrative_area_level_2_short, :string
    field :administrative_area_level_3, :string
    field :administrative_area_level_3_short, :string
    field :administrative_area_level_4, :string
    field :administrative_area_level_4_short, :string
    field :administrative_area_level_5, :string
    field :administrative_area_level_5_short, :string

    field :country, :string
    field :country_short, :string
    field :postal_code, :string
    field :postal_code_short, :string
    field :postal_code_suffix, :string
    field :postal_code_suffix_short, :string
    field :longitude, :float
    field :latitude, :float
    field :user_type, :string
    field :google_maps_place_id, :string
    field :sublocality, :string
    field :sublocality_short, :string

    field :wifi, :boolean, default: false
    field :bathtub, :boolean, default: false
    field :shower, :boolean, default: false
    field :ethernet_connection, :boolean, default: false
    field :smoke_alarms, :boolean, default: false
    field :oven, :boolean, default: false
    field :stove, :boolean, default: false
    field :microwave, :boolean, default: false
    field :dish_washer, :boolean, default: false
    field :refrigerator, :boolean, default: false
    field :patio_or_balcony, :boolean, default: false
    field :backyard, :boolean, default: false
    field :gym, :boolean, default: false
    field :pool, :boolean, default: false
    field :square_footage, :integer, default: 0
    field :bedrooms, :integer, default: 0
    field :washrooms, :integer, default: 0

    field :monthly_rent, :integer, default: nil
    field :furnished, :boolean, default: false
    field :smoking, :boolean, default: false
    field :ev_charging, :boolean, default: false
    field :dogs_ok, :boolean, default: false
    field :cats_ok, :boolean, default: false
    field :wheelchair_accessible, :boolean, default: false
    field :sale_or_rent, Ecto.Enum, values: [:sale, :rent]

    field :laundry_type, Ecto.Enum,
      values: [:in_suite_laundry, :in_building_laundry, :laundry_available, :none]

    field :parking, Ecto.Enum,
      values: [
        :attached_garage_parking,
        :detached_garage_parking,
        :street_parking,
        :off_street_parking,
        :parking_available,
        :none
      ]

    field :property_type, Ecto.Enum,
      values: [
        :apartment,
        :house,
        :room_only,
        :townhouse,
        :condo,
        :duplex,
        :loft,
        :land,
        :flat,
        :cottage_or_cabin
      ]

    field :air_conditioning_type, Ecto.Enum, values: [:central_ac, :ac_available, :none]

    field :heating_type, Ecto.Enum,
      values: [
        :central_heating,
        :electric_heating,
        :gas_heating,
        :radiator_heating,
        :heating_available,
        :none
      ]

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
      :administrative_area_level_1,
      :administrative_area_level_1_short,
      :administrative_area_level_2,
      :administrative_area_level_2_short,
      :administrative_area_level_3,
      :administrative_area_level_3_short,
      :administrative_area_level_4,
      :administrative_area_level_4_short,
      :administrative_area_level_5,
      :administrative_area_level_5_short,
      :country,
      :country_short,
      :postal_code,
      :postal_code_short,
      :longitude,
      :latitude,
      :user_type,
      :google_maps_place_id,
      :postal_code_suffix,
      :postal_code_suffix_short,
      :sublocality,
      :sublocality_short,
      :wifi,
      :bathtub,
      :shower,
      :ethernet_connection,
      :smoke_alarms,
      :oven,
      :stove,
      :microwave,
      :dish_washer,
      :refrigerator,
      :patio_or_balcony,
      :backyard,
      :gym,
      :pool,
      :square_footage,
      :bedrooms,
      :washrooms,
      :monthly_rent,
      :furnished,
      :smoking,
      :ev_charging,
      :dogs_ok,
      :cats_ok,
      :wheelchair_accessible,
      :sale_or_rent,
      :laundry_type,
      :parking,
      :property_type,
      :air_conditioning_type,
      :heating_type
    ])
    |> unique_constraint(:google_maps_place_id)
  end

  def get_amenities do
    @amenities
  end
end
