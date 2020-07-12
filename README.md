# Foo

Let's learn how we can create an event system using elixir registry.

You can find the official doc [here](https://hexdocs.pm/elixir/Registry.html).

The main purpose of the project is learn how can we reduce depencing inside our project(s).

To easily start, I already create on application called `FooApp` that will start a supervisor for our Registry.

So, concretly, what will we do?

- Register 2 modules to a Registry.
- Dispatch an event and handle it to our modules.
- Wrap it all inside a module to make it easier to use.


