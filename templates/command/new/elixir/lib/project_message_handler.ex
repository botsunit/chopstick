defmodule <%= project_name_camelize %>.MessageHandler do
  require Bitwise
  require Record
  Record.defrecord :message, Record.extract(:message, from_lib: "wok_message_handler/include/wok_message_handler.hrl")

  def create(from, to, body, options \\ []) do
    :erlang.term_to_binary(message(
    uuid: uuid(),
    from: from,
    to: to,
    headers: options,
    body: body),  [:compressed])
  end

  def parse(message) do
    {:ok, :erlang.binary_to_term(message), ""}
  end

  def uuid() do
    <<a::size(32), b::size(16), c::size(16), d::size(16), e::size(48)>> = :crypto.rand_bytes(16)
    str = :io_lib.format('~8.16.0b-~4.16.0b-4~3.16.0b-~4.16.0b-~12.16.0b', [a, b, Bitwise.band(c, 4096), Bitwise.bor(Bitwise.band(d, 16383), 32768), e])
    List.to_string(str)
  end
end
