defmodule <%= bot_name_camelize %>.RestControllers.MyRestResourcesController do
  def show(req, state) do
    id = :cowboy_req.binding(:id, req)
    message = "Hello <%= bot_name_camelize %>.RestControllers.MyRestResourcesController " <> id
    {200, [{"content-type", "text/plain"}], message, state}
  end
end

