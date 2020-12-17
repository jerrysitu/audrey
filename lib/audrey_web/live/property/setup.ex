defmodule AudreyWeb.PropertyLive.Setup do
  use AudreyWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(user_type: "")}
  end

  @impl true
  def handle_event(
        "select-user-type",
        %{"type" => type},
        socket
      ) do
    IO.inspect(type, label: "type!!")

    {:noreply, socket |> assign(user_type: type)}
  end

  def handle_event(
        "save-property",
        %{
          "property" => %{
            "city" => city,
            "state" => state,
            "street_address" => street_address,
            "zip" => zip,
            "country" => country
          },
          "user" => %{"user_type" => user_type}
        } = params,
        socket
      ) do
    IO.inspect(params, label: "params!!")

    address = "#{street_address}+#{city}+#{state}+#{zip}+#{country}"

    # address = "210+Carrall+street+vancouver"

    {:ok, geocode_response} = Audrey.API.GoogleMaps.get_geocode(address)

    IO.inspect(geocode_response, label: "geocode_response!!")

    lng =
      geocode_response
      |> Map.get(:body, [])
      |> Map.get("results", [])
      |> List.first()
      |> get_in(["geometry", "location", "lng"])

    lat =
      geocode_response
      |> Map.get(:body, [])
      |> Map.get("results", [])
      |> List.first()
      |> get_in(["geometry", "location", "lat"])

    first_address_component =
      geocode_response
      |> Map.get(:body, [])
      |> Map.get("results", [])
      |> List.first()
      |> Map.get("address_components", [])

    street_number =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["street_number"] end)
      |> List.first()
      |> Map.get("long_name")

    street_number_short =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["street_number"] end)
      |> List.first()
      |> Map.get("short_name")

    route =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["route"] end)
      |> List.first()
      |> Map.get("long_name")

    route_short =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["route"] end)
      |> List.first()
      |> Map.get("short_name")

    neighborhood =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["neighborhood", "political"] end)
      |> List.first()
      |> Map.get("long_name")

    neighborhood_short =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["neighborhood", "political"] end)
      |> List.first()
      |> Map.get("short_name")

    locality =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["locality", "political"] end)
      |> List.first()
      |> Map.get("long_name")

    locality_short =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["locality", "political"] end)
      |> List.first()
      |> Map.get("short_name")

    administrative_area_level_2 =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["administrative_area_level_2", "political"] end)
      |> List.first()
      |> Map.get("long_name")

    administrative_area_level_2_short =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["administrative_area_level_2", "political"] end)
      |> List.first()
      |> Map.get("short_name")

    administrative_area_level_1 =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["administrative_area_level_1", "political"] end)
      |> List.first()
      |> Map.get("long_name")

    administrative_area_level_1_short =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["administrative_area_level_1", "political"] end)
      |> List.first()
      |> Map.get("short_name")

    country =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["country", "political"] end)
      |> List.first()
      |> Map.get("long_name")

    country_short =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["country", "political"] end)
      |> List.first()
      |> Map.get("short_name")

    postal_code =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["postal_code"] end)
      |> List.first()
      |> Map.get("long_name")

    postal_code_short =
      first_address_component
      |> Enum.filter(fn x -> x["types"] == ["postal_code"] end)
      |> List.first()
      |> Map.get("short_name")

    Audrey.Location.create_property(%{
      street_number: street_number,
      street_number_short: street_number_short,
      route: route,
      route_short: route_short,
      neighborhood: neighborhood,
      neighborhood_short: neighborhood_short,
      locality: locality,
      locality_short: locality_short,
      administrative_area_level_2: administrative_area_level_2,
      administrative_area_level_2_short: administrative_area_level_2_short,
      administrative_area_level_1: administrative_area_level_1,
      administrative_area_level_1_short: administrative_area_level_1_short,
      country: country,
      country_short: country_short,
      postal_code: postal_code,
      postal_code_short: postal_code_short,
      longitude: lng,
      latitude: lat,
      user_type: user_type
    })
    |> IO.inspect(label: "Created property")

    {:noreply,
     socket
     |> assign(user_type: "")
     |> redirect(to: Routes.page_path(socket, :index))}
  end

  def handle_event(
        "back-to-main",
        _params,
        socket
      ) do
    {:noreply,
     socket
     |> redirect(to: Routes.page_path(socket, :index))}
  end
end
