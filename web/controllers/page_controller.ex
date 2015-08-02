defmodule MyApp_802337.PageController do
  use MyApp_802337.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
