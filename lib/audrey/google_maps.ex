defmodule Audrey.GoogleMaps do
  def parse_geo_code_response(%{status: 200, body: %{"results" => results}}) do
    lng =
      results
      |> List.first()
      |> get_in(["geometry", "location", "lng"])

    lat =
      results
      |> List.first()
      |> get_in(["geometry", "location", "lat"])

    place_id =
      results
      |> List.first()
      |> Map.get("place_id", nil)

    first_address_component =
      results
      |> List.first()
      |> Map.get("address_components", [])

    street_number =
      first_address_component
      |> get_by_type("street_number")

    route =
      first_address_component
      |> get_by_type("route")

    neighborhood =
      first_address_component
      |> get_by_type("neighborhood")

    locality =
      first_address_component
      |> get_by_type("locality")

    administrative_area_level_1 =
      first_address_component
      |> get_by_type("administrative_area_level_1")

    administrative_area_level_2 =
      first_address_component
      |> get_by_type("administrative_area_level_2")

    administrative_area_level_3 =
      first_address_component
      |> get_by_type("administrative_area_level_3")

    administrative_area_level_4 =
      first_address_component
      |> get_by_type("administrative_area_level_4")

    administrative_area_level_5 =
      first_address_component
      |> get_by_type("administrative_area_level_5")

    country =
      first_address_component
      |> get_by_type("country")

    postal_code =
      first_address_component
      |> get_by_type("postal_code")

    sublocality =
      first_address_component
      |> get_by_type("sublocality")

    %{
      street_number: street_number |> Map.get("long_name", nil),
      street_number_short: street_number |> Map.get("short_name", nil),
      route: route |> Map.get("long_name", nil),
      route_short: route |> Map.get("short_name", nil),
      neighborhood: neighborhood |> Map.get("long_name", nil),
      neighborhood_short: neighborhood |> Map.get("short_name", nil),
      locality: locality |> Map.get("long_name", nil),
      locality_short: locality |> Map.get("short_name", nil),
      administrative_area_level_1: administrative_area_level_1 |> Map.get("long_name", nil),
      administrative_area_level_1_short:
        administrative_area_level_1 |> Map.get("short_name", nil),
      administrative_area_level_2: administrative_area_level_2 |> Map.get("long_name", nil),
      administrative_area_level_2_short:
        administrative_area_level_2 |> Map.get("short_name", nil),
      administrative_area_level_3: administrative_area_level_3 |> Map.get("long_name", nil),
      administrative_area_level_3_short:
        administrative_area_level_3 |> Map.get("short_name", nil),
      administrative_area_level_4: administrative_area_level_4 |> Map.get("long_name", nil),
      administrative_area_level_4_short:
        administrative_area_level_4 |> Map.get("short_name", nil),
      administrative_area_level_5: administrative_area_level_5 |> Map.get("long_name", nil),
      administrative_area_level_5_short:
        administrative_area_level_5 |> Map.get("short_name", nil),
      country: country |> Map.get("long_name", nil),
      country_short: country |> Map.get("short_name", nil),
      postal_code: postal_code |> Map.get("long_name", nil),
      postal_code_short: postal_code |> Map.get("short_name", nil),
      sublocality: sublocality |> Map.get("long_name", nil),
      sublocality_short: sublocality |> Map.get("short_name", nil),
      longitude: lng,
      latitude: lat,
      google_maps_place_id: place_id
    }
  end

  defp get_by_type(address_component, type) do
    component =
      address_component
      |> Enum.filter(fn x ->
        Enum.any?(x["types"], fn x -> x == type end)
      end)

    case component |> length do
      0 ->
        %{"long_name" => nil, "short_name" => nil}

      1 ->
        component |> List.first()

      _ ->
        {:error, "more than one component"}
    end
  end
end

# {:ok, geocode_response_1} = Audrey.API.GoogleMaps.get_geocode("516+foster+Avenue+coquitlam+bc+canada")
# place_id: ChIJZ2DN2zd4hlQRdLtWzY0Kdmc
# {:ok, geocode_response_2} = Audrey.API.GoogleMaps.get_geocode("210+carrall+street+vancouver+bc+canada")

# Audrey.GoogleMaps.parse_geo_code_response(geocode_response_1)
# Audrey.GoogleMaps.parse_geo_code_response(geocode_response_2)
