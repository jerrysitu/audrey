defmodule Audrey.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Audrey.Repo,
      # Start the Telemetry supervisor
      AudreyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Audrey.PubSub},
      # Start the Endpoint (http/https)
      AudreyWeb.Endpoint
      # Start a worker by calling: Audrey.Worker.start_link(arg)
      # {Audrey.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Audrey.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AudreyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
