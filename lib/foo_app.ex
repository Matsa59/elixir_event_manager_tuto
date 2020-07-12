defmodule FooApp do
  use Application

  def start(_type, _opts) do
    children = [
      {Registry, keys: :duplicate, name: EventManager.get_registry_name()},
      %{
        id: EventManager,
        start: {EventManager, :start_subscriptions, []}
      }
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
