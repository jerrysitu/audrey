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

    field :square_footage, :integer, default: 0
    field :bedrooms, :integer, default: 0
    field :washrooms, :integer, default: 0
    field :monthly_rent, :integer, default: nil

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

  def convert_sale_or_rent(:sale), do: "sale"
  def convert_sale_or_rent(:rent), do: "rent"
  def convert_sale_or_rent(_), do: "sale or rent"

  def convert_laundry_type(:in_suite_laundry), do: "In-Suite Laundry"
  def convert_laundry_type(:in_building_laundry), do: "In-building Laundry"
  def convert_laundry_type(:laundry_available), do: "Laundry Available"
  def convert_laundry_type(:none), do: "No Laundry"
  def convert_laundry_type(_), do: "Laundry Unknown"

  def convert_parking(:attached_garage_parking), do: "Attached Garage Parking"
  def convert_parking(:detached_garage_parking), do: "Detached Garage Parking"
  def convert_parking(:street_parking), do: "Street Parking"
  def convert_parking(:off_street_parking), do: "Off Street Parking"
  def convert_parking(:parking_available), do: "Parking Available"
  def convert_parking(:none), do: "No Parking"
  def convert_parking(_), do: "Parking Unknown"

  def convert_property_type(:apartment), do: "Apartment"
  def convert_property_type(:house), do: "House"
  def convert_property_type(:room_only), do: "Room Only"
  def convert_property_type(:townhouse), do: "Townhouse"
  def convert_property_type(:condo), do: "Condo"
  def convert_property_type(:duplex), do: "Duplex"
  def convert_property_type(:loft), do: "Loft"
  def convert_property_type(:land), do: "Land"
  def convert_property_type(:flat), do: "Flat"
  def convert_property_type(:cottage_or_cabin), do: "Cottage or Cabin"
  def convert_property_type(_), do: "Property Type Unknown"

  def convert_air_conditioning_type(:central_ac), do: "Central A/C"
  def convert_air_conditioning_type(:ac_available), do: "A/C Available"
  def convert_air_conditioning_type(:none), do: "No A/C"
  def convert_air_conditioning_type(_), do: "A/C Unknown"

  def convert_heating_type(:central_heating), do: "Central Heating"
  def convert_heating_type(:electric_heating), do: "Electrical Heating"
  def convert_heating_type(:gas_heating), do: "Gas Heating"
  def convert_heating_type(:radiator_heating), do: "Radiator Heating"
  def convert_heating_type(:heating_available), do: "Heating Available"
  def convert_heating_type(:none), do: "No Heating"
  def convert_heating_type(_), do: "Heating Unknown"

  def convert_amenity(:wifi), do: "Wi-Fi"
  def convert_amenity(:bathtub), do: "Bathtub"
  def convert_amenity(:shower), do: "Shower"
  def convert_amenity(:ethernet_connection), do: "Ethernet Connection"
  def convert_amenity(:smoke_alarms), do: "Smoke Alarms"
  def convert_amenity(:oven), do: "Oven"
  def convert_amenity(:stove), do: "Stove"
  def convert_amenity(:microwave), do: "Microwave"
  def convert_amenity(:dish_washer), do: "Dishwasher"
  def convert_amenity(:refrigerator), do: "Refrigerator"
  def convert_amenity(:patio_or_balcony), do: "Patio or Balcony"
  def convert_amenity(:backyard), do: "Backyard"
  def convert_amenity(:gym), do: "Gym"
  def convert_amenity(:pool), do: "Pool"
  def convert_amenity(:furnished), do: "Furnished"
  def convert_amenity(:smoking), do: "Smoking Allowed"
  def convert_amenity(:ev_charging), do: "EV Charging"
  def convert_amenity(:dogs_ok), do: "Dogs allowed"
  def convert_amenity(:cats_ok), do: "Cats allowed"
  def convert_amenity(:wheelchair_accessible), do: "Wheelchair Accessible"
  def convert_amenity(_), do: ""
end
