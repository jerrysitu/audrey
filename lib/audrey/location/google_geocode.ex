defmodule Audrey.Location.GoogleGeocode do
  defstruct [
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
    :administrative_area_level_1,
    :administrative_area_level_2,
    :administrative_area_level_2_short,
    :administrative_area_level_2,
    :administrative_area_level_3,
    :administrative_area_level_3_short,
    :administrative_area_level_3,
    :administrative_area_level_4,
    :administrative_area_level_4_short,
    :administrative_area_level_4,
    :administrative_area_level_5,
    :administrative_area_level_5_short,
    :administrative_area_level_5,
    :country,
    :country_short,
    :postal_code,
    :postal_code_short,
    :sublocality,
    :sublocality_short,
    :longitude,
    :latitude,
    :google_maps_place_id
  ]

  use ExConstructor
end
