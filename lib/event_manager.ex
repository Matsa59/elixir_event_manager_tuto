defmodule EventManager do
  @moduledoc """
  The event manager dispatches events to subscribers.
  """

  @registry_name EventManagerRegistry

  require Logger

  @doc """
  Subscribe to an event.
  """
  def subscribe(event, subscriber) when is_atom(subscriber) do
    if {:module, _} = Code.ensure_loaded(subscriber) do
      if :attributes |> subscriber.module_info() |> Enum.member?({:behaviour, [EventHandler]}) do
        Registry.register(@registry_name, event, subscriber)
      else
        Logger.warn("Module #{subscriber} must implement the behaviour EventHandler")
      end
    else
      Logger.warn("Module #{subscriber} doesn't exist.")
      :error
    end
  end

  @doc """
  Dispatch my event to every registered subscriber.
  """
  def dispatch(event_name, event_data) do
    msg = %{event: event_name, payload: event_data}

    Registry.dispatch(@registry_name, event_name, fn state ->
      for {_pid, subscriber} <- state do
        apply(subscriber, :handle_event, [msg])
      end
    end)
  end

  @doc """
  Start subscriptions reading the config file.
  """
  def start_subscriptions() do
    Logger.info("Start subscriptions ...")

    Application.get_env(:foo, :event_subscriptions)
    |> Enum.each(fn {event_name, subscribers} ->
      for subscriber <- subscribers do
        Logger.debug("Add subscriber \"#{subscriber}\" for event \"#{event_name}\".")

        EventManager.subscribe(event_name, subscriber)
      end
    end)

    {:ok, self()}
  end

  def get_registry_name(), do: @registry_name
end
