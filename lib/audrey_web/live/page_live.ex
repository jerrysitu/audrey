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
        "redirect-to-setup",
        _params,
        socket
      ) do
    {:noreply,
     socket
     |> redirect(to: Routes.property_setup_path(socket, :setup))}
  end
end
