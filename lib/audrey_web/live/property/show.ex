defmodule AudreyWeb.PropertyLive.Show do
  alias Audrey.Location.Property
  use AudreyWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => property_id} = _params, _session, socket) do
    property =
      Audrey.Location.get_property!(property_id)
      |> IO.inspect(label: "propertyyyyy", limit: :infinity)

    available_amenities =
      property
      |> Map.to_list()
      |> Enum.filter(fn {k, _v} ->
        Enum.any?(Audrey.Location.Property.get_amenities(), fn x -> k == x end)
      end)
      |> Enum.filter(fn {_k, v} ->
        v == true
      end)
      |> Enum.map(fn {key, _v} ->
        Audrey.Location.Property.convert_amenity(key)
      end)
      |> IO.inspect(label: "amenitiesssss")

    property_comments = Audrey.Location.list_property_comments_by_property_id(property_id)

    {
      :noreply,
      socket
      |> assign(property_comments: property_comments)
      |> assign(available_amenities: available_amenities)
      |> assign(property: property)
    }
  end

  @impl true
  def handle_event(
        "back-to-main",
        _params,
        socket
      ) do
    {:noreply,
     socket
     |> redirect(to: Routes.page_path(socket, :index))}
  end

  def handle_event(
        "submit-comment",
        %{"property_comment" => %{"comment" => comment, "property_id" => property_id}} = params,
        socket
      ) do
    IO.inspect(params, label: "params!!!")

    Audrey.Location.create_property_comment(%{
      property_id: property_id,
      comment: comment,
      inserted_at: Timex.now("America/Vancouver")
    })

    property_comments = Audrey.Location.list_property_comments_by_property_id(property_id)

    {:noreply,
     socket
     |> assign(property_comments: property_comments)}
  end

  def handle_event("add_random_sighting", _params, socket) do
    random_sighting = generate_random_sighting()

    # inform the browser / client that there is a new sighting
    {:noreply, push_event(socket, "new_sighting", %{sighting: random_sighting})}
  end

  def handle_event(
        "new-like",
        %{"comment-id" => comment_id, "property-id" => property_id} = params,
        socket
      ) do
    IO.inspect(params, label: "Paramssss")

    property_comment = Audrey.Location.get_property_comment!(comment_id)

    Audrey.Location.update_property_comment(property_comment, %{likes: property_comment.likes + 1})

    property_comments = Audrey.Location.list_property_comments_by_property_id(property_id)

    {:noreply,
     socket
     |> assign(property_comments: property_comments)}
  end

  defp generate_random_sighting() do
    # https://developers.google.com/maps/documentation/javascript/reference/coordinates
    # Latitude ranges between -90 and 90 degrees, inclusive.
    # Longitude ranges between -180 and 180 degrees, inclusive
    %{
      latitude: Enum.random(-90..90),
      longitude: Enum.random(-180..180)
    }
  end
end
