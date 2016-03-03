-module(<%= bot_name %>).

-export([start/0]).

start() ->
	application:ensure_all_started(<%= bot_name %>).

