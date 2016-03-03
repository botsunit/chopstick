% @hidden
-module(<%= bot_name %>_rest_handler).

-export([do_get/1, about/1]).

about(Req) ->
  wok_response:render(Req, about_tmpl).

do_get(Req) ->
  wok_response:set_response(Req, {200,
                                  [{<<"content-type">>, <<"text/plain">>}],
                                  <<"Hello <%= bot_name %>_rest_handler">>}).

