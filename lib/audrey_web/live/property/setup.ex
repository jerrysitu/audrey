defmodule AudreyWeb.PropertyLive.Setup do
  use AudreyWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    changeset =
      Audrey.Location.Property.changeset(
        %Audrey.Location.Property{
          bedrooms: "",
          washrooms: "",
          square_footage: ""
        },
        %{}
      )

    {:ok,
     socket
     |> assign(changeset: changeset)
     |> assign(user_type: "")}
  end

  @impl true
  def handle_event(
        "select-user-type",
        %{"type" => type},
        socket
      ) do
    IO.inspect(type, label: "type!!")

    {:noreply,
     socket
     |> assign(user_type: type)}
  end

  def handle_event(
        "update-property",
        %{
          "property" => property
        },
        socket
      ) do
    changeset = Audrey.Location.Property.changeset(%Audrey.Location.Property{}, property)

    {:noreply, socket |> assign(changeset: changeset)}
  end

  def handle_event(
        "save-property",
        %{
          "property" =>
            %{
              "city" => city,
              "state" => state,
              "street_address" => street_address,
              "zip" => zip,
              "street_number" => street_number,
              "country" => country
            } = property
        },
        socket
      ) do
    IO.inspect(property, label: "property!!")

    address =
      "#{street_number}+#{street_address}+#{city}+#{state}+#{zip}+#{country}"
      |> IO.inspect(label: "Addressssssss!!")

    # address = "210+Carrall+street+vancouver"

    {:ok, geocode_response} = Audrey.API.GoogleMaps.get_geocode(address)

    property =
      property
      |> Enum.map(fn {k, v} ->
        k = k |> String.to_atom()
        {k, v}
      end)
      |> Map.new()

    params =
      Audrey.GoogleMaps.parse_geo_code_response(geocode_response)
      |> Map.merge(property)
      |> IO.inspect(label: "paramsssss")

    changeset =
      Audrey.Location.Property.changeset(%Audrey.Location.Property{}, params)
      |> IO.inspect(label: "Changesettttt")

    case Audrey.Location.create_property(params) do
      {:ok, property} ->
        {:noreply,
         socket
         |> assign(user_type: "")
         |> redirect(to: Routes.property_show_path(socket, :show, property.id))}

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset, label: "error changesetttt")

        {:noreply,
         socket
         |> assign(changeset: changeset)
         |> put_flash(
           :error,
           "Something went wrong, please see errors."
         )}
    end

    # with {:ok, property} <-
    #        params
    #        |> Audrey.Location.create_property()
    #        |> IO.inspect(label: "Created property") do
    #   {:noreply,
    #    socket
    #    |> assign(user_type: "")
    #    |> redirect(to: Routes.property_show_path(socket, :show, property.id))}
    # else
    #   _error ->
    #     {:noreply,
    #      socket
    #      |> assign(changeset: changeset)
    #      |> put_flash(
    #        :error,
    #        "Something went wrong, please see errors."
    #      )}
    # end
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
