% @hidden
-module(<%= bot_name %>_rest_handler).

-export([do_get/2]).

do_get(_Req, State) ->
  {200, [{<<"content-type">>, <<"text/plain">>}], <<"Hello <%= bot_name %>_rest_handler">>, State}.

