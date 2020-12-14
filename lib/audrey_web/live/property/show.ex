defmodule AudreyWeb.PropertyLive.Show do
  use AudreyWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => property_id} = _params, _session, socket) do
    property = Audrey.Location.get_property!(property_id) |> IO.inspect(label: "property")

    property_comments = Audrey.Location.list_property_comments_by_property_id(property_id)

    {
      :noreply,
      socket
      |> assign(property_comments: property_comments)
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
     |> push_redirect(to: Routes.page_path(socket, :index))}
  end

  def handle_event(
        "submit-comment",
        %{"property_comment" => %{"comment" => comment, "property_id" => property_id}} = params,
        socket
      ) do
    IO.inspect(params, label: "params!!!")

    Audrey.Location.create_property_comment(%{
      property_id: property_id,
      comment: comment
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
