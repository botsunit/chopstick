defmodule <%= project_name_camelize %>.MessageControllers.MyRessourceController do
  require Record
  require Logger
  Record.defrecord :message, Record.extract(:message, from_lib: "wok_message_handler/include/wok_message_handler.hrl")

  def create(message, state) do
    Logger.info("In <%= project_name_camelize %> with message #{message(message, :uuid)}")
    {:noreply, state}
  end
end
