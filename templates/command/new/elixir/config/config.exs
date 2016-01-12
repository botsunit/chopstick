use Mix.Config

config :wok,
  messages: [
    handler: <%= project_name_camelize %>.Wok.MessageHandler,
    services: [
      {"*/my_resource/created", {<%= project_name_camelize %>.MessageControllers.MyResourceController, :create}}
      #{"*/my_resource/destroyed", {<%= project_name_camelize %>.MessageControllers.MyResourceController, :destroy}}
      #{"*/my_resource/updated", {<%= project_name_camelize %>.MessageControllers.MyResourceController, :update}}
    ],
    consumer_group: "<%= project_name_camelize %>",
    local_queue_name: "<%= project_name %>_queue",
    local_consumer_group: "<%= project_name_camelize %>ConsumerGroup",
    max_services_fork: 3,
    topics: [
      {"bots_events_#{Mix.env}", [fetch_frequency: 5000, max_bytes: 10485760, max_messages: 1000]}
    ]
  ],
  initializer: [
    {<%= project_name_camelize %>.Wok.Initializer, []}
  ],
  rest: [
    port: 8075,
    ip: '0.0.0.0',
    max_conn: 100,
    routes: [
      {:GET, '/my_rest_resources/:id', {<%= project_name_camelize %>.RestControllers.MyRestResourcesController, :show}},
      #{:POST, '/my_rest_resources', {<%= project_name_camelize %>.RestControllers.MyRestResourcesController, :create}},
      #{:PUT, '/my_rest_resources/:id', {<%= project_name_camelize %>.RestControllers.MyRestResourcesController, :update}},
      #{:DELETE, '/my_rest_resources/:id', {<%= project_name_camelize %>.RestControllers.MyRestResourcesController, :destroy}},
      #{'WS', "/my_rest_resources/:id", {<%= project_name_camelize %>.RestControllers.MyRestResourcesController, :connect}}
      {:static, "/public", {:priv_dir, :<%= project_name %>, "public_files"}}
    ],
    cors: [
        {:'Access-Control-Allow-Methods', ["GET",
                                          "POST",
                                          "PUT",
                                          "PATCH",
                                          "HEAD",
                                          "OPTIONS",
                                          "DELETE"]},
        {:'Access-Control-Allow-Origin', "*"},
        {:'Access-Control-Max-Age', 1728001},
        {:'Access-Control-Allow-Credentials', true},
        {:'Access-Control-Allow-Headers', ["Access-Control-Allow-Origin",
                                          "Authorization",
                                          "Origin",
                                          "x-requested-with",
                                          "Content-Type",
                                          "Content-Range",
                                          "Content-Disposition",
                                          "Content-Description"]}
    ]
  ]
config :kafe,
  brokers: [
    {'127.0.0.1', 9092}
  ],
  client_id: "kafe",
  api_version: 0,
  correlation_id: 0,
  socket: [
    {'sndbuf', 4194304},
    {'recbuf', 4194304},
    {'buffer', 4194304}
  ]
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

import_config "#{Mix.env}.exs"

