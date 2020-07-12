defmodule FooApp do
  use Application

  def start(_type, _opts) do
    children = []
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
