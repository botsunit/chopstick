defmodule <%= project_name_camelize %>.RESTHandler do
  def do_get(_req, state) do
    {200, [{"content-type", "text/plain"}], "Hello <%= project_name_camelize %>.RESTHandler", state}
  end
end

