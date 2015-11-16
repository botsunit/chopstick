% @hidden
-module(<%= project_name %>_rest_handler).

-export([do_get/2]).

do_get(_Req, State) ->
  {200, [{<<"content-type">>, <<"text/plain">>}], <<"Hello <%= project_name %>_rest_handler">>, State}.

