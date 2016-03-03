defmodule <%= bot_name_camelize %>.RestControllers.MyRestResourcesController do
  def about(req) do
    Wok.Response.render(req, :about_tmpl)
  end

  def show(req) do
    {:ok, id, req} = Wok.Request.param(req, :id)
    message = "Hello <%= bot_name_camelize %>.RestControllers.MyRestResourcesController " <> id
    Wok.Response.set_response(req, {200, [{"content-type", "text/plain"}], message})
  end
end

