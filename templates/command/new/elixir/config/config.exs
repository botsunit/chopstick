use Mix.Config

config :wok,
  messages: [
    handler: <%= project_name_camelize %>.MessageHandler,
    services: [
      {"my_service", {<%= project_name_camelize %>.ServiceHandler, :action}}
    ],
    consumer_group: "<%= project_name_camelize %>",
    local_queue_name: "<%= project_name %>_queue",
    local_consumer_group: "<%= project_name_camelize %>ConsumerGroup",
    max_services_fork: 3,
    topics: [
      {"test", [fetch_frequency: 5000, max_bytes: 10485760]},
    ]
  ],
  initializer: [
    {<%= project_name_camelize %>.Initialiser, []}
  ],
  rest: [
    port: 8080,
    ip: '0.0.0.0',
    max_conn: 100,
    routes: [
      {:GET, '/<%= project_name %>', {<%= project_name_camelize %>.RESTHandler, :do_get}},
    ]
  ]

config :kafe,
  brokers: [
    {'localhost', 9092}
  ],
  client_id: "kafe",
  api_version: 0,
  correlation_id: 0

config :pipette,
  segment_path: './queues',
  segment_memory_size: 10485760,
  segment_file_size: 1073741824,
  segment_flush_frequency: 0,
  retention_hours: 128,
  retention_check_interval: 300000

config :lager,
  handlers: [
    lager_console_backend: [:info, {:lager_default_formatter, [:date, ' ', :time, ' [', :severity, '] -- ', :module, ':', :function, ' (', :pid, '/', :line, ') -- ', :message, '\n']}],
    lager_file_backend: [file: 'log/wok_error.log', level: :error],
    lager_file_backend: [file: 'log/wok_debug.log', level: :debug],
    lager_file_backend: [file: 'log/wok_console.log', level: :info]
  ]

