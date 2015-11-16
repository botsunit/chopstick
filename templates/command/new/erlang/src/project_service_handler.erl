% @hidden
-module(<%= project_name %>_service_handler).
-include_lib("wok_message_handler/include/wok_message_handler.hrl").

-export([action/2]).

action(Message, State) ->
  lager:info("<%= project_name %>_message_handler ~p :: ~p", [Message, State]),
  {noreply, State}.

