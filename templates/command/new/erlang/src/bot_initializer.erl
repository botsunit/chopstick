% @hidden
-module(<%= bot_name %>_initializer).
-behaviour(wok_initializer).

-export([init/1]).

init(Args) ->
  {ok, Args}.
