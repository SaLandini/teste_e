defmodule Erolled.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Erolled.Repo,
      # Start the Telemetry supervisor
      ErolledWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Erolled.PubSub},
      # Start the Endpoint (http/https)
      ErolledWeb.Endpoint
      # Start a worker by calling: Erolled.Worker.start_link(arg)
      # {Erolled.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Erolled.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ErolledWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
