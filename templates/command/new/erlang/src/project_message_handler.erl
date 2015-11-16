% @hidden
-module(<%= project_name %>_message_handler).
-behaviour(wok_message_handler).
-include_lib("wok_message_handler/include/wok_message_handler.hrl").

-export([create/3, create/4, parse/1]).

create(From, To, Body) ->
  create(From, To, Body, []).

create(From, To, Body, Options) ->
  term_to_binary(#message{
                    uuid = uuid(),
                    from = From,
                    to = To,
                    headers = Options,
                    body = Body},  [compressed]).

parse(Message) ->
  {ok, binary_to_term(Message), <<>>}.

uuid() ->
  <<A:32, B:16, C:16, D:16, E:48>> = crypto:rand_bytes(16),
  Str = io_lib:format("~8.16.0b-~4.16.0b-4~3.16.0b-~4.16.0b-~12.16.0b", 
                      [A, B, C band 16#0fff, D band 16#3fff bor 16#8000, E]),
  list_to_binary(Str).
