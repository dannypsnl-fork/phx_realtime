defmodule PhxRealtimeWeb.PageController do
  use PhxRealtimeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
