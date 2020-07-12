import Config

config :foo,
  event_subscriptions: %{"test" => [CustomHandler1, CustomHandler2]}
