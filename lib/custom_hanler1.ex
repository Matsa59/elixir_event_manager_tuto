defmodule CustomHandler1 do
  @behaviour EventHandler

  def handle_event(%{event: "test", payload: event_data}) do
    IO.inspect("--- custom handler 1 ---")
    IO.inspect(event_data)
    IO.inspect("--- end ---")
  end
end

defmodule CustomHandler2 do
  def handle_event(%{event: "test", payload: data}) do
    IO.inspect("THIS IS AN EVENT: ")
    IO.inspect(data)
    IO.inspect("----- end -----")
  end

  def handle_event(%{event: "another_event", payload: data}) do
    IO.inspect("--- another event test ---")
    IO.inspect(data)
    IO.inspect("---- end another event -----")
  end
end
