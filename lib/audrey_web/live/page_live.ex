defmodule AudreyWeb.PageLive do
  use AudreyWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    properties = Audrey.Location.list_properties()

    {:ok,
     socket
     |> assign(properties: properties)
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

    long =
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

    Audrey.Location.create_property(%{
      city: city,
      state: state,
      street_address: street_address,
      user_type: user_type,
      zip: zip,
      country: country,
      longitude: long,
      latitude: lat
    })
    |> IO.inspect(label: "Created property")

    properties = Audrey.Location.list_properties()

    {:noreply,
     socket
     |> assign(properties: properties)
     |> assign(user_type: "")}
  end

  def handle_event(
        "property-redirect",
        %{"property-id" => property_id} = params,
        socket
      ) do
    IO.inspect(params, label: "params!!")

    {:noreply,
     socket
     |> redirect(to: Routes.property_show_path(socket, :show, property_id))}

    # socket
    # |> redirect(to: Routes.property_show_path(socket, :show, property_id))
  end
end
