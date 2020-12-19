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

    address =
      "#{street_address}+#{city}+#{state}+#{zip}+#{country}"
      |> IO.inspect(label: "Addressssssss!!")

    # address = "210+Carrall+street+vancouver"

    {:ok, geocode_response} = Audrey.API.GoogleMaps.get_geocode(address)

    with {:ok, property} <-
           Audrey.GoogleMaps.parse_geo_code_response(geocode_response)
           |> Map.put(:user_type, user_type)
           |> Audrey.Location.create_property()
           |> IO.inspect(label: "Created property") do
      {:noreply,
       socket
       |> assign(user_type: "")
       |> redirect(to: Routes.property_show_path(socket, :show, property.id))}
    else
      _error ->
        {:noreply,
         socket
         |> put_flash(
           :error,
           "Sorry, it looks like that property already exists. TODO: Render link to go to that property, or just redirect if already exists..."
         )}
    end
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
