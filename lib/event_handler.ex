defmodule EventHandler do
  @moduledoc """
  Handle an event.

  Event message is define with the following format :
  ```
  %{event: "event_name", payload: "data"}
  ```

  The payload data could be any kind of data type (integer, float, Map ...).
  """
  @callback handle_event(%{event: String.t(), payload: any}) :: :ok | :error
end
